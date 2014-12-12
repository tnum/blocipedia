require 'rails_helper'

feature 'User sign up' do
 
  scenario 'user goes to the signup form' do
    visit('/')
    click_on("Sign up")
    expect(current_path).to eq('/users/sign_up')
  end

  scenario 'successfully create an account' do
    visit('/users/sign_up')
    fill_out_credentials
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  
end

# As a user, I should be able to sign up for a free account by providing a user name, password and email address.