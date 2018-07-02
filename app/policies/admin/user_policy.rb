class Admin::UserPolicy < Admin::AdminPolicy
  def index?
    true
  end

  def new?
    false
  end

  def edit?
    false
  end
end