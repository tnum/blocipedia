require 'rails_helper'

feature 'Private wikis' do
  before do
    @wiki_private = create(:wiki, title: 'My Private Wiki', is_private: true, id: 007 )
    @wiki_public = create(:wiki, title: 'Public Wiki' )
  end
  
  scenario 'that can not be accessed by standard users' do
    @user_standard = create(:user, role: 'standard')
    standard_user_log_in
    visit('/wikis/007')
    expect(page).to_not have_content('My Private Wiki')
  end
  
  scenario 'and adds standard users as collaborators' do
  end

  scenario 'that can be accessed by a collaborator of any role' do
  end

end

