require 'rails_helper'

feature 'User signs in' do

  before do
    @user = create(:user)
  end

  scenario 'successfully' do
    click_sign_in_link
    fill_in_credentials
    expect(page).to have_content("Signed in successfully.")
  end
  
end


# As a user, I want to be able to sign in and out of Bloccipedia.