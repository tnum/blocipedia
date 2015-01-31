def fill_out_credentials
  within 'form' do
    fill_in( 'Name', :with => 'John Smith' )
    fill_in( 'Email', :with => 'john@example.com' )
    fill_in( 'Password', :with => 'helloworld' )
    fill_in( 'Password confirmation', :with => 'helloworld' )
    click_button( 'Sign up' )
  end
end


def fill_out_incorrect_credentials
  within 'form' do
    fill_in( 'Name', :with => 'John Smith' )
    fill_in( 'Email', :with => 'john@example.com' )
    fill_in( 'Password', :with => 'helloworld' )
    fill_in( 'Password confirmation', :with => '' )
    click_button( 'Sign up' )
  end
end

def click_sign_in_link
  visit( '/' )
  click_link( 'Sign in' )
end

def fill_in_credentials
  within 'form' do
    fill_in( 'Email', with: @user.email )
    fill_in( 'Password', with: @user.password )
    click_on( 'Sign in' )
  end
end

def premium_user_log_in
  visit( '/' )
  click_link( 'Sign in' )
   within 'form' do
    fill_in( 'Email', with: @premium_user.email )
    fill_in( 'Password', with: @premium_user.password )
    click_on( 'Sign in' )
  end
end

def standard_user_log_in
  visit( '/' )
  click_link( 'Sign in' )
  within 'form' do
    fill_in( 'Email', with: @user_standard.email )
    fill_in( 'Password', with: @user_standard.password )
    click_on( 'Sign in' )
  end
end

def sign_out
  within 'nav' do
    click_link( 'Log out' )
  end
  visit('/')
end

def create_new_wiki
  click_on( 'New wiki post' )
  within 'form' do
    fill_in( 'Title', with: 'My New Wiki' )
    fill_in( 'Body', with: 'Welcome to my new wiki entry' )
    click_on( 'Save' )
  end
end

def create_wiki_without_title
  click_on( 'New wiki post' )
  within 'form' do
    fill_in( 'Body', with: 'Welcome to my new wiki entry' )
    click_on( 'Save' )
  end
end

def create_private_wiki
  #visit( '/wikis/new' )
  within 'form' do
    fill_in( 'Title', with: 'Private wiki 2' )
    fill_in( 'Body', with: 'Welcome to my new wiki entry' )
    find(:css, "#wiki_is_private").set(true)
    click_on( 'Save' )
  end
end

def click_on_upgrade_link
  within 'nav' do
    click_on( 'Upgrade' )
  end
end

def edit_wiki
  within('section.main') do
    click_link('edit')
  end
  within 'form' do
    fill_in('Title', with: 'Edited Title')
    click_on( 'Save' )
  end
end

def read_wiki
  within('.wiki-index') do
    click_link('MyString')
  end
end

def delete_wiki
  within('.wiki-actions') do
    click_link('delete')
  end
end

def select_upgrade
  visit('/')
  click_link('Upgrade')
end

def fill_in_card_details
  within('form') do
    fill_in( 'card_number', with: '5555555555554444' )
    fill_in( 'cvc', with: '424' )
    fill_in( 'expmonth', with: '07' )
    fill_in( 'expyear', with: '17' )
    click_button( 'submit' )
  end
end

def upgrade_account
  @user.role = :premium
  @user.save
  visit('/')
end

