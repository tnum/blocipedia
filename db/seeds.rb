require 'faker'

# Create users

15.times do 
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10) 
  )
  user.skip_confirmation!
  user.save  
end
users = User.all

# Create wikis
50.times do
  wiki = Wiki.create(
    user:  users.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
  wiki.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
end

wikis = Wiki.all

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save

# Create a standard user
standard = User.new(
  name:     'Admin Standard',
  email:    'standard@example.com',
  password: 'helloworld',
  role:     'standard'
)
standard.skip_confirmation!
standard.save

# Create a standard user
standard2 = User.new(
  name:     'Standard',
  email:    'standard2@example.com',
  password: 'helloworld',
  role:     'standard'
)
standard2.skip_confirmation!
standard2.save


