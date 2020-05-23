class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

  def check_admin
    if !(logged_in? && current_user.admin)
      redirect_to root_path
    end
  end

  def check_user
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    return !current_user.nil?
  end

  def check_same_user(user)
    if !(logged_in? && (user.id == current_user.id || current_user.admin))
      redirect_to root_path
    end
  end
end
