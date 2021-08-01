# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users page', :js do
  include SessionHelpers

  before do
    User.create!(first_name: 'Han', last_name: 'Solo', username: 'han.solo@example.com')
    User.create!(first_name: 'Leia', last_name: 'Organa', username: 'leia.organa@example.com')
  end

  context 'when logged in' do
    before do
      user = User.create!(first_name: 'Test', last_name: 'User', username: 'test@example.com')
      login(user)
    end

    scenario 'user views the page' do
      visit '/users'
      expect(page).to have_content 'Users'
      expect(page).to have_selector '[data-test=user]', count: 3

      user_rows = page.all '[data-test=user]'
      expect(user_rows.length).to eq 3

      expect(user_rows.at(0)).to have_content 'Han Solo han.solo@example.com'
      expect(user_rows.at(1)).to have_content 'Leia Organa leia.organa@example.com'
      expect(user_rows.at(2)).to have_content 'Test User test@example.com'
    end
  end

  context 'when not logged in' do
    scenario 'user views the page' do
      visit '/users'
      expect(page.current_path).to eq('/')
      expect(page).not_to have_content 'Users'
      expect(page).to have_content('Login')
    end
  end
end
