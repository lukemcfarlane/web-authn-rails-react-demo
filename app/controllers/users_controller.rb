
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_auth

  def index
    @current_user = User.find(session[:current_user_id])
    @users = User.order(first_name: :asc)
  end
end
