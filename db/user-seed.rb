require 'bcrypt'
module UserSeed
  include BCrypt
  4.times do
    pw_hash = Password.create("guest")
    User.create(username: Faker::Internet.user_name, password_hash: pw_hash)
  end
end
