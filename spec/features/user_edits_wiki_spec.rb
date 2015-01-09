require 'rails_helper'

feature 'User edits wiki' do 

  before do
     @wiki = create(:wiki)
  end
  
  scenario 'successfully as an admin' do
    @user = create(:user, role: 'admin')
    click_sign_in_link
    fill_in_credentials

    within('.wiki-index') do
      find(:css, 'span.edit').should click_link('edit')
    end

    expect(page).to have_content('Edit wiki')

  end

  scenario 'successfully as a user' do
    @user = create(:user, role: 'standard')
    click_sign_in_link
    fill_in_credentials

    within('.wiki-index') do
      find(:css, 'span.edit').should click_link('edit')
    end

    expect(page).to have_content('Edit wiki')
  end

  scenario 'unsuccessfully as a visitor' do
    visit('/')
    within('.wiki-index') do
      expect(page).to_not have_link('edit')
    end
  end

end