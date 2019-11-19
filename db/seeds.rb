50.times do
  full_name = Faker::Name.unique.name
  user_name = Faker::Internet.unique.user_name
  email = Faker::Internet.unique.email
  password = 'password'
  password_confirmation = 'password'

  User.create!(
    full_name: full_name,
    user_name: user_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
  )
end
