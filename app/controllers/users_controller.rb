class UsersController < ApplicationController
  before_action :require_auth

  def index
    @users = User.order(name: :asc)
  end
end
