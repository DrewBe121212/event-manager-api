class ApplicationController < ActionController::API
  include ExceptionHandler
  include Pundit

  after_action :verify_authorized

  def current_user
    @current_user ||= User.new
  end

  protected

  def respond(response) 
    render json: response
  end

  def respond_with_errors(errors, fields = {})

     response = {
      errors: {
        error: errors
      }
    }

    unless fields.empty?
      response[:errors][:fields] = fields
    end

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
