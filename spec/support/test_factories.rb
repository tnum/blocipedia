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

  def create_wiki_without_title
    click_on( 'New wiki post' )
    within 'form' do
      fill_in( 'Body', with: 'Welcome to my new wiki entry' )
      click_on( 'Save' )
    end
  end
  
end

