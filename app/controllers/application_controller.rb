class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, alert: exception.message
  end

  protected

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
