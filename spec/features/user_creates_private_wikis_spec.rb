require 'rails_helper'

feature 'User creates private wikis' do 
  before do
    @wiki_private = create(:wiki, title: 'My Private Wiki', is_private: true, id: 007 )
    @wiki_public = create(:wiki, title: 'Public Wiki' )
  end

  scenario 'successfully if premium user' do
    @premium_user = FactoryGirl.create(:user, role: 'premium')
    premium_user_log_in
    click_on( 'New wiki post' )
    expect(page).to have_content('Private wiki')
    create_private_wiki
    expect(page).to have_content('Private wiki 2')
  end

  scenario 'that can not be accessed by visitors' do
    visit('/')
    expect(page).to_not have_content('My Private Wiki')
    expect(page).to have_content('Public Wiki')
  end

  scenario 'unsuccessfully if standard user' do
    @user_standard = create(:user, role: 'standard')
    standard_user_log_in
    click_on( 'New wiki post' )
    expect(page).to_not have_content('Private wiki')
  end
  
end