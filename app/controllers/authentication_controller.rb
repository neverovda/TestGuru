class AuthenticationController < ApplicationController

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      cookies[:first_path] = request.path
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password please.'
    end
  end

end  
