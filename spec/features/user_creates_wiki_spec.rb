require 'rails_helper'

feature 'User creates wiki' do

  before do
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end

  scenario 'successfully' do
    create_new_wiki
    expect(page).to have_content("My New Wiki")
  end

  scenario 'without a title' do
    create_wiki_without_title
    expect(page).to have_content("Error")
  end

  scenario 'can then update the entry' do
    create_new_wiki
    within('.wiki-actions') do
      expect(page).to have_link('edit')
    end
  end

  scenario 'then can delete the entry' do
    create_new_wiki
    visit('/')
    within('section.main') do
      click_link("My New Wiki")
    end
    expect(page).to have_content("delete")
  end

  scenario 'can not update the entry once logged out' do
    create_new_wiki
    sign_out
    within('.wiki-index') do
      expect(page).to_not have_content('edit')
    end
  end

  scenario 'unsuccessfully without an accout' do
    sign_out
    visit( '/wikis/new' )
    expect(current_path).to eq('/')
  end
  
end

# As a user with a standard account, I want create, read, update, and delete public wikis which anyone can view.