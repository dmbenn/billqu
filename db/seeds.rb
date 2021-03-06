require 'faker'

#Adding Standard Test Users
5.times do 
  user = User.new(
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    role: 'standard'
    )
  user.skip_confirmation!
  user.save!
end

#Adding Standard Test Users
5.times do 
  user = User.new(
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    role: 'premium'
    )
  user.skip_confirmation!
  user.save!
end

#Test standard User
admin = User.new(
  email:      'standard@example.com',
  password:   'testtest',
  role: 'standard'
)
admin.skip_confirmation!
admin.save!

#Test premium User
admin = User.new(
  email:      'premium@example.com',
  password:   'testtest',
  role: 'premium'
)
admin.skip_confirmation!
admin.save!

#Test Admin User
admin = User.new(
  email:      'admin@example.com',
  password:   'testtest',
  role: 'admin'
)
admin.skip_confirmation!
admin.save!

users = User.all

#fake codes
15.times do
  Code.create(
    title:  Faker::Lorem.characters(10),
    body:   Faker::Lorem.paragraph(3),
  )
end

codes = Code.all

40.times do
  Editor.create(
    code: codes.sample,
    user: users.sample
    )
end


puts "Seed Finished"
puts "#{User.count} users created"
