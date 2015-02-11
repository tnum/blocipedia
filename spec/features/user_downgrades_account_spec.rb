require 'rails_helper'

feature 'User downgrades account' do

  scenario 'successfully as a premium user' do
    @premium_user = FactoryGirl.create(:user, role: 'premium')
    premium_user_log_in
    click_link('My Account')
    expect(page).to have_content('Premium Member')

    click_link('Cancel Subscription')
    expect(page).to have_content('Standard Member')
  end

end