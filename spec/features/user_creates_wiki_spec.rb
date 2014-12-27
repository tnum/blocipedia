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
    within('.wiki-index') do
      find(:css, 'span.edit').should have_link('edit')
    end
  end

  scenario 'can delete the entry' do
    create_new_wiki
    click_link("My New Wiki")
    expect(page).to have_content("delete")
  end
  
end

# As a user with a standard account, I want create, read, update, and delete public wikis which anyone can view.