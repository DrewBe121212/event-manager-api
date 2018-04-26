class ApplicationController < ActionController::API
  include ExceptionHandler

  load_and_authorize_resource

  def current_user
    @current_user ||= User.new
  end

  protected

  def respond(response) 
    render json: response
  end

  def respond_with_errors(errors)
    response = {
      errors: {
        error: errors
      }
    }
    respond response
  end

  def respond_with_field_errors(errors)
    response = {
      errors: {
        fields: errors    
      }
    }
    respond response
  end

end
