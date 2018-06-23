class MenuPolicy < ApplicationPolicy
  attr_reader :user, :menu

  def initialize(user, menu)
    @user = user
    @menu = menu
  end

  def user?
    true
  end
end