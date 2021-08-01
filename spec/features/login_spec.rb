# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login page', :js do
  before do
    User.create!(first_name: 'Luke', last_name: 'Skywalker', username: 'luke.skywalker@example.com')
  end

  scenario 'user logs in then logs out' do
    visit '/'
    expect(page).to have_content 'Login'

    fill_in 'Username', with: 'luke.skywalker@example.com'
    click_button 'Login'

    expect(page).to have_content 'Users'

    click_button 'Logout'
    expect(page).to have_content 'Login'
    visit '/users'
    expect(page).not_to have_content 'Users'
    expect(page).to have_content 'Login'
  end

  scenario 'user tries to log in with invalid username' do
    visit '/'
    expect(page).to have_content 'Login'

    fill_in 'Username', with: 'invalid@example.com'
    click_button 'Login'

    expect(page).to have_content 'Invalid username'
  end
end
