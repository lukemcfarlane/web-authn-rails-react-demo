
# frozen_string_literal: true

class SessionsController < ApiController
  def create
    user = User.find_by!(username: username)
    session[:current_user_id] = user.id
  end

  private

  def username
    params.fetch(:username)
  end
end
