
# frozen_string_literal: true

class SessionsController < ApiController
  def create
    user = User.find_by!(username: username)
    session[:current_user_id] = user.id
  end

  def destroy
    session.delete :current_user_id
    redirect_to(root_path)
  end

  private

  def username
    params.fetch(:username)
  end
end
