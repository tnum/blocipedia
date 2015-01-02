require 'rails_helper'

feature 'User edits any public wiki' do

  before do
    @wiki = create(:wiki)
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end

  scenario 'successfully' do
    within('.wiki-index') do
      find(:css, 'span.edit').should have_link('edit')
    end
  end
  
end

# Users should be able to edit any public wiki

# Will be updated once private wiki functionality is set up