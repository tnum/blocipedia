require 'rails_helper'

feature 'User signs up' do

  scenario 'successfully' do
    visit('/')
    click_link 'Sign up'
    fill_out_credentials
    expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
  end

  # invalid sign up

  scenario 'unsuccessfully' do
    visit('/')
    click_link 'Sign up'
    fill_out_incorrect_credentials
    expect(page).to have_content("error")
  end
  
end

# As a user, I should be able to sign up for a free account by providing a user name, password and email address.