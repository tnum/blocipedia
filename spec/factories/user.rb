FactoryGirl.define do
  factory :user do
    name "John Doe"
    # sequence(:email, 50) { |n| "person#{n}@example.com" }
    email "john@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now  
  end
end