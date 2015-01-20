require 'rails_helper'

feature 'User upgrades account' do

  before do
    @wiki = create(:wiki)
    @user = create(:user)

    visit('/users/sign_in')

    Capybara.within 'form' do
      fill_in( 'Email', with: "john@example.com" )
      fill_in( 'Password', with: "helloworld")
      click_on( 'Sign in' )
    end
   
  end
  
  scenario 'successfully', driver: :selenium do 

    expect(page).to have_content('Sign in')
    
    


    #click_sign_in_link
    #fill_in_credentials
    #click_link('Upgrade')
    #visit('/charges/new')
    #sleep(1.7)
    #stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    #Capybara.within_frame stripe_iframe do
    #  fill_in "email", with: "test-user@example.com"
    #end

  end

end

# User signs up for a free plan

# User upgrades their free plan and is prompted to pay with Stripe

# User's role is changed from standard (free) to premium

# User is able to create private wikis