class SessionPolicy < Struct.new(:user, :session)
  attr_reader :user, :session

  def initialize(user, session)
    @user = user
    @session = session
  end

  def show?
    true
  end

  def new?
    not_authenticated 
  end

  def create? 
    not_authenticated
  end

  def create_sso?
    not_authenticated
  end

  def destroy?
    !not_authenticated
  end

  private

  def not_authenticated
    user.new_record?
  end

end