module UserSeed

  5.times do
    User.create(username: Faker::Internet.user_name)
  end
end
