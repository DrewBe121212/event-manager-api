class MenusController < ApplicationController
  
  def index

    menus = Rails.cache.fetch("menu_tree", expires_in: 24.hours) do
      menus = menu_tree.as_json(
        :children => true, 
        :only => [
          :id, :parent_id, :title, :url, :icon, :visible, :children,
          :authorize_perform, :authorize_on
        ]
      )
    end

    self.respond menus
  end

  private

  def menu_tree
    Menu.where(:parent => nil).active.sorted
  end

  def menu_params
    params.require(:menu).permit(:parent_id, :title, :url, :sort, :visible, :active)
  end  

end
