Fabricator(:user) do
  username { Faker::Internet.email }
  password 'password'
  role 'admin'
end