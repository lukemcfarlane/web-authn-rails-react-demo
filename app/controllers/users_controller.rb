class UsersController < ApplicationController
  def index
    @users = User.order(name: :asc)
  end
end
