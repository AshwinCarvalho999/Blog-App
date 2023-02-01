class ApplicationController < ActionController::Base
  def current_user
    # return the first user in the database
    @user = User.first
  end
end
