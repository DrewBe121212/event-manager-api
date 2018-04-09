class ApplicationController < ActionController::API
  include ExceptionHandler

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
    render json: response
  end

  def respond_with_field_errors(errors)
    response = {
      errors: {
        fields: errors    
      }
    }
    render json: response
  end

end
