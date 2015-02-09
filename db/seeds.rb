require 'faker'

#Adding Test Users
5.times do 
  user = User.new(
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

users = User.all


#Test Admin User
admin = User.new(
  email:      'admin@example.com',
  password:   'testtest',
)
admin.skip_confirmation!
admin.save!


puts "#{User.first.email} 1st email"
puts "Seed Finished"
puts "#{User.count} users created"
