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

  scenario 'can not make payment once premium' do
    upgrade_account
    visit('/charges/new')
    expect(current_path).to eq(root_path)
  end

end

# User signs up for a free plan

# User upgrades their free plan and is prompted to pay with Stripe

# User's role is changed from standard (free) to premium

# User is able to create private wikis