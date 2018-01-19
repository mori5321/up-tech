class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  private
  def not_authenticated
    redirect_to :sign_in
  end

  def user_not_authorized(exception)
    loyalty_name = exception.loyalty.class.to_s.underscore

    flash[:error] = t "#{loyalty_name}.#{exception.query}", scope: "banken", default: :default
    redirect_to(request.referrer || root_path)
  end
end
