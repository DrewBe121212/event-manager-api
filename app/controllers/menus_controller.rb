class MenusController < ApplicationController
  
  def index
    authorize :menu

    self.respond menu_tree
  end

  private

  def as_json(menu)
    menu.as_json(:only => [
      :id, :parent_id, :title, :url, :icon, :visible, :children
    ])
  end

  def menu_tree
    menus = policy_scope(Menu).where(:parent => nil).active.sorted
    menu_tree_recurse(menus)
  end

  def menu_tree_recurse(menus)
    menus = menu_rejections(menus)
    # build the json menus manually, since we end up incurring additional queries
    # and ineficiencies when using to_json :include
    json_menus = []

    menus.each do |menu|
      child_menus = menu.children.active.sorted.to_a
      visible_child_menus_count = child_menus.count { |x| x.visible }

      # conver to json and attach children
      json_menu = as_json(menu)
      json_menu[:children] = menu_tree_recurse(child_menus)

      visible_child_menus_count_after_reject = json_menu[:children].count { |x| x['visible'] }
      active_children_count = visible_child_menus_count_after_reject-visible_child_menus_count

      if (active_children_count >= 0)
        json_menus << json_menu
      end
    end

    json_menus
  end

  def menu_rejections(menus)
    menus.reject do |menu|
      reject = false
      unless menu.authorize_on.nil? || menu.authorize_perform.nil?
        policy = Pundit.policy(current_user, menu.authorize_on.to_sym)
        reject = policy.nil? || !policy.try(menu.authorize_perform.to_sym)
      end

      reject
    end
  end

  def menu_params
    params.require(:menu).permit(:parent_id, :title, :url, :sort, :visible, :active)
  end  

end
