require 'rails_helper'

feature 'User upgrades account' do

  before do
    @wiki = create(:wiki)
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end

  scenario 'successfully' do
    expect(page).to have_content('standard')
    select_upgrade
    upgrade_account
    expect(page).to have_content('premium')
  end

  scenario 'for a year' do
    # user who upgraded 11 months ago
    # gets reminder to upgrade account for next year
  end

  scenario 'can not make payment once premium' do
    upgrade_account
    visit('/charges/new')
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are already a premium member')
  end

  scenario 'is downgraded if their membership expires' do
    # user upgraded 12 months ago
    # does not upgrade their account
    # is downgraded to stadard membership
  end

end