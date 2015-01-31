FactoryGirl.define do
  factory :user do
    name "John Doe"
    # sequence(:email, 50) { |n| "person#{n}@example.com" }
    email "john@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    role "standard"
    confirmed_at Time.now  
  end

  #factory :premium_user do
    #name "Jane Doe"
    #email "jane@example.com"
    #password "helloworld"
    #password_confirmation "helloworld"
    #role "premium"
    #confirmed_at Time.now
  #end
end