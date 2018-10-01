class Users::SessionsController < Devise::SessionsController
  
  after_action :welcome_notice, only: :create

  def welcome_notice
    flash[:notice] = "Welcome, #{current_user.first_name} #{current_user.last_name}"     
  end   
  
end
