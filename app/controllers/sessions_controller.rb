class SessionsController < ApplicationController

  
  
  #login
  def create

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
  
        self.respond response
      else
        self.respond_with_errors 'Invalid username and/or password'
      end
    end
  end

  #logout
  def destroy

  end

end
