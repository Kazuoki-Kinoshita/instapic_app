50.times do |n|
  full_name = Faker::Name.name
  user_name = Faker::Internet.user_name
  email = Faker::Internet.email
  password = "password"
  User.create!(user_name: user_name,
               full_name: full_name,
               email: email,
               password: password,
               )
end