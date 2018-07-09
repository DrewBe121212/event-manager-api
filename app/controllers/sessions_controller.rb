class SessionsController < ApplicationController

  def show
    authorize :session
  
    response = current_user.as_json(
      :root => true,
      :include => :roles,
      :only => [
        :id, :username, :email, :first_name, :middle_name, :last_name, 
        :current_sign_in_at, :last_sign_in_at, :roles
      ]
    )

    response[:policies] = PolicyCollector.new(current_user).policies
   
    self.respond response

  end

  #login
  def create
    authorize :session

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

  # sso login
  def create_sso
    authorize :session

  end

  #logout
  def destroy
    authorize :session
  end

end
