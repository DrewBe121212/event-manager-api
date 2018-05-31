class Ability
  include CanCan::Ability

  def initialize(user)
    # stuff everyone can do regardless of current status
    can :view, :session
    can :view, :daily_schedule
    can :manage, :users

    unless user.new_record?
      # items all logged in users can do
      can :destroy, :session

      # role specific items
      roles = user.roles

      unless roles.empty?
        roles.each do |role|
          send(role.referred_name) if self.responds_to? role.referred_name
        end
      end
    else
      can :new, [:session, :session_guest, :session_sso]
    end

  end

  private

  def admin
    can :manage, :all
  end

  def staff
    can :manage, [:event]
  end

end
