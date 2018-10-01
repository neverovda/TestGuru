class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    return admin_tests_path if current_user.is_a?(Admin)
    root_path
  end  

end
