class UsersController < ApplicationController
  
  def update
    current_user.downgrade
    redirect_to edit_user_registration_path
    flash[:notice] = "Successfully Downgraded"
  end
  
end
