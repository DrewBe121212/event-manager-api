class Admin::UserPolicy < Admin::AdminPolicy
  def index?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end
end