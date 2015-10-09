class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user
  
  private

  def current_user
    begin
      user = User.find(session[:user_id]) if session[:user_id]
    rescue
      return nil
    end
    @current_user ||= user
  end

end
