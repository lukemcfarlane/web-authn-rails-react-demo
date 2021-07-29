# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users page' do
  before do
    User.create!(name: 'Han Solo', username: 'han.solo@example.com')
    User.create!(name: 'Leia Organa', username: 'leia.organa@example.com')
  end

  scenario 'user views the page' do
    visit '/users'
    expect(page).to have_content 'Users'
    expect(page).to have_selector '[data-test=user]', count: 2

    user_rows = page.all '[data-test=user]'
    expect(user_rows.length).to eq 2

    expect(user_rows.at(0)).to have_content 'Han Solo han.solo@example.com'
    expect(user_rows.at(1)).to have_content 'Leia Organa leia.organa@example.com'
  end
end
