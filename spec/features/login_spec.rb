# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login page', :js do
  scenario 'user views the page' do
    visit '/'
    expect(page).to have_content 'Login'
    click_button 'Login'
    expect(page).to have_content 'Users'
  end
end
