require 'rails_helper'

feature 'User signs up' do

  scenario 'successfully' do
    visit('/users/sign_up')
    fill_out_credentials
    expect(page).to have_content("Welcome! You have signed up successfully")
  end

  # invalid sign up

  scenario 'unsuccessfully' do
    visit('/users/sign_up')
    fill_out_incorrect_credentials
    expect(page).to have_content("error")
  end
  
end

# As a user, I should be able to sign up for a free account by providing a user name, password and email address.