class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include Pundit
  
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    if current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    else
      flash[:alert] = "Please Login"
      redirect_to new_user_session_path
    end
  end
  
end
