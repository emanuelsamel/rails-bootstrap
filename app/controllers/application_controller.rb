class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_flash

  helper_method :current_user


  def current_user
    session[:user_id] && User.find(session[:user_id])
  end
  private

  def show_flash
    flash.now[:notice] = "Found the about page!" if request.path == '/pages/about'
  end
end
