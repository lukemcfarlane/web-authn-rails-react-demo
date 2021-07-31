# frozen_string_literal: true

class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: 'not found' }, status: :not_found
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: { error: "'#{e.param}' is required" }, status: :unprocessable_entity
  end
end
