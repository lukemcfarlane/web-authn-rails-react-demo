
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_auth

  def index
    @users = User.order(first_name: :asc)
  end
end
