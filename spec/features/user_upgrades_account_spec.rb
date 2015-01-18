require 'rails_helper'

feature 'User upgrades account' do

  before do
    @wiki = create(:wiki)
    @user = create(:user)
    click_sign_in_link
    fill_in_credentials
  end
  
  scenario 'successfully', :js => true do 
    click_link('Upgrade')
    expect(page).to have_content('Upgrade Membership')
  end

end

# User signs up for a free plan

# User upgrades their free plan and is prompted to pay with Stripe

# User's role is changed from standard (free) to premium

# User is able to create private wikis