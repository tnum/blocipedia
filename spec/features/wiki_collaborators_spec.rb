require 'rails_helper'

feature 'Wiki collaborators' do 
  before do
    @premium_user = FactoryGirl.create(:user, role: 'premium', email: 'jane@example.com')
    @user_standard = FactoryGirl.create(:user, role: 'standard')
  end

  scenario 'can be added by a premium author successfully' do
    @wiki = FactoryGirl.create(:wiki, user_id: 1, is_private: true)
    premium_user_log_in
    click_edit_private_wiki_link
    expect(page).to have_content('Add Collaborators')
    within('.add-collaborators') do
      click_link('Add as collaborator')
    end
    within('.current-collaborators') do
      expect(page).to have_content('John Doe')
    end
  end

  scenario 'can be removed by a premium author successfully' do
    @wiki = FactoryGirl.create(:wiki, user_id: 1, is_private: true)
    @collaboration = FactoryGirl.create(:collaborator)
    premium_user_log_in
    click_edit_private_wiki_link
    expect(page).to have_link('Remove collaborator')
  end

  scenario 'can be added by a standard author unsuccessfully' do
    @wiki = FactoryGirl.create(:wiki)
    standard_user_log_in
    click_edit_wiki_link
    expect(page).to_not have_content('Add collaborators')
  end

  scenario 'can access a private wiki successfully' do
    @wiki = FactoryGirl.create(:wiki, user_id: 1, is_private: true)
    @collaboration = FactoryGirl.create(:collaborator)
    standard_user_log_in
    expect(page).to have_content('MyString')
  end

  scenario 'can access a private wiki once removed unsuccessfully' do
    standard_user_log_in
    expect(page).to_not have_content('MyString')
  end

  scenario 'can be added to a public wiki unsuccessfully' do
    @wiki = FactoryGirl.create(:wiki, user_id: 1, is_private: false)
    premium_user_log_in
    click_edit_private_wiki_link
    expect(page).to_not have_content('Add Collaborators')
  end
  
end