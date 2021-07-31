class ApplicationController < ActionController::Base
  private

  def require_auth
    redirect_to root_path unless session.has_key?(:current_user_id)
  end
end
