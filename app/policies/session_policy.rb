class SessionPolicy < Struct.new(:user, :session)

  def index?
    !authenticated
  end
 
  def show?
    true
  end

  def new?
    !authenticated
  end

  def create? 
    !authenticated
  end

  def destroy?
    authenticated
  end

  private

  def authenticated
    !user.new_record?
  end

end