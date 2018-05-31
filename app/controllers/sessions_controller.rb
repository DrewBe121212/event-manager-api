class SessionsController < ApplicationController
  skip_load_and_authorize_resource

  def show
    authorize! :view, :session

    response = {}
    response[:user] = current_user.as_json :except => ['password_digest', 'reset_password_token', 'confirmation_token']
    response[:user][:roles] = current_user.roles
    response[:abilities] = current_ability.permissions

    self.respond response
  end

  #login
  def create
    authorize! :new, :session_guest

    errors = {}

    if params[:username].blank?
      errors[:username] = 'Username is required'
    end

    if params[:password].blank?
      errors[:password] = 'Password is required'
    end

    if errors.size > 0
      self.respond_with_field_errors(errors)
    else
      user = User.where(email: params[:username]).or(User.where(username: params[:username])).take

      authenticatedUser = user && user.authenticate(params[:password])
  
      unless authenticatedUser.nil?
        # build out successful response object
        response = {
          authenticated: true,
          token: JsonWebToken.encode(id: user.id),
          user: user
        }
  
        show
      else
        errors[:username] = '';
        errors[:password] = '';

        self.respond_with_errors('Invalid username and/or password', errors)
      end
    end
  end

  #logout
  def destroy
    authorize! :destroy, :session
  end

end
