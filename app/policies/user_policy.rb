class UserPolicy < ApplicationPolicy
  def new?
    !authenticated
  end
  
  private

  def authenticated
    !user.new_record?
  end
end