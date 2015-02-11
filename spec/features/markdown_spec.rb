require 'rails_helper'

feature 'Markdown' do

  before do
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end

  scenario 'can be used to format the text' do
    click_on( 'New wiki post' )
    within 'form' do
      fill_in( 'Title', with: 'My New Wiki' )
      fill_in( 'Body', with: "For more information [use Google](https://www.google.com)" )
      click_on( 'Save' )
    end
    expect(page).to have_content('For more information')
    expect(page).to have_link('use Google')
  end

end