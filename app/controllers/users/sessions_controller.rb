class Users::SessionsController < Devise::SessionsController
  
  def create
    super
    flash[:notice] = t('.welcome', first_name: current_user.first_name,
                                   last_name: current_user.last_name)
  end   
  
end
