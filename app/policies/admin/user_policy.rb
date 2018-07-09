class Admin::UserPolicy < Admin::AdminPolicy
  def index?
    false
  end

  def new?
    false
  end

  def edit?
    false
  end
end