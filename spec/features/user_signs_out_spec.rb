require 'rails_helper'

feature 'User signs out' do

  before do
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end

  scenario 'successfully' do
    click_link('Log out')
    expect(page).to have_content("Signed out successfully.")
  end
  
end


# As a user, I want to be able to sign in and out of Bloccipedia.