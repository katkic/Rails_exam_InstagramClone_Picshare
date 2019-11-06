User.create!(
  full_name: '山田 太郎',
  user_name: 'yamada',
  email: 'yamada@example.com',
  password: 'password!',
  password_confirmation: 'password!',
  image: 'default.png',
  admin: true
)

50.times do
  full_name = Faker::Name.unique.name
  user_name = Faker::Internet.unique.user_name
  email = Faker::Internet.unique.email
  password = 'password'
  password_confirmation = 'password'
  image = 'default.png'

  User.create!(
    full_name: full_name,
    user_name: user_name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    image: image
  )
end
