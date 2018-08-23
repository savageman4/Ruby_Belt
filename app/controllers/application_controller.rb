class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_login  #checks whether or not user is signed in before many methods in the app

  def current_user #used in many methods to pull in the current user stored in sessions. 
  	User.find(session[:user_id]) if session[:user_id]
  end
   
  def check_login   #run before many methods in the app to be sure the user is logged in. If not redirect to login page. 
  	redirect_to "/login" unless session[:user_id]
  end

end




