require 'rails_helper'

feature 'User creates private wikis' do 
  before do
    @wiki = create(:wiki)
  end

  scenario 'successfully if premium user' do
    @user = create(:user, role: 'premium')
    premium_user_log_in
    click_on( 'New wiki post' )
    expect(page).to have_content('Private wiki')

    create_private_wiki
    expect(page).to have_content('My private wiki entry')
    visit('/')
    expect(page).to have_content('My private wiki entry')
    expect(page).to have_content('MyString')
  end

  scenario 'that can not be accessed by visitors' do
    @user = create(:user, role: 'premium')
    premium_user_log_in
    create_private_wiki
    click_link('Log out')
    expect(page).to_not have_content('My private wiki entry')
    expect(page).to have_content('MyString')
  end

  scenario 'unsuccessfully if standard user' do
    @user_standard = create(:user, role: 'standard')
    standard_user_log_in
    click_on( 'New wiki post' )
    expect(page).to_not have_content('Private wiki')
  end
  
end