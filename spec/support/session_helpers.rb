# frozen_string_literal: true

module SessionHelpers
  def login(user)
    visit '/'
    fill_in 'Username', with: user.username
    click_button 'Login'
  end
end
