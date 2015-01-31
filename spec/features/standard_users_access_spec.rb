require 'rails_helper'

feature 'Standard users access' do

  before do
    @wiki = create(:wiki)
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end

  scenario 'update public wikis successfully' do
    within('section.main') do
      within('.wiki-index') do
        expect(page).to have_link('edit')
      end
    end
    edit_wiki
    expect(page).to have_content('Edited Title')
  end

  scenario 'access full wiki and delete successfully' do
    read_wiki
    delete_wiki
    visit('/')
    expect(page).to_not have_content('MyString')
  end
  
end

# Users should be able to edit any public wiki

# Will be updated once private wiki functionality is set up