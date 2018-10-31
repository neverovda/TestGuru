class PersonalBadgesController < ApplicationController
  
  def index
    @badges = Badge.all
    @personal_badges = current_user.badges
  end
  
end
