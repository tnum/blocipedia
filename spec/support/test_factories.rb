
def fill_out_credentials
  within 'form' do
    fill_in('Name', :with => 'John Smith')
    fill_in('Email', :with => 'john@example.com')
    fill_in('Password', :with => 'helloworld')
    fill_in('Password confirmation', :with => 'helloworld')
    click_button('Sign up')
  end
end

def fill_out_incorrect_credentials
  within 'form' do
    fill_in('Name', :with => 'John Smith')
    fill_in('Email', :with => 'john@example.com')
    fill_in('Password', :with => 'helloworld')
    fill_in('Password confirmation', :with => 'heloworld')
    click_button('Sign up')
  end
end