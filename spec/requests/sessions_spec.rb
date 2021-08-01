# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions endpoint', type: :request do
  let!(:user) {
    User.create!(first_name: 'Test', last_name: 'User', username: 'test@example.com')
  }

  describe 'POST /sessions' do
    let(:params) { { username: username } }

    before do
      post '/sessions', params: params.to_json,
                        headers: { 'Content-Type' => 'application/json' }
    end

    context 'when username does not match' do
      let(:username) { 'foo@example.com' }

      specify do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when no username specified' do
      let(:params) { {} }

      specify do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body['error']).to eq "'username' is required"
      end
    end

    context 'when username matches' do
      let(:username) { 'test@example.com' }

      specify do
        expect(response).to have_http_status(:success)
        expect(session[:current_user_id]).to eq(user.id)
      end
    end
  end

  describe 'DELETE /session' do
    before do
      allow_any_instance_of(ActionDispatch::Request)
        .to receive(:session)
        .and_return(current_user_id: user.id)
    end

    specify do
      delete '/session'
      expect(response).to redirect_to(root_path)
      expect(session).not_to have_key(:current_user_id)
    end
  end
end
