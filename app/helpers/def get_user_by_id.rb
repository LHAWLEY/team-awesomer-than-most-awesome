def get_user_by_id(id)
  user = User.find(id) if id
  return user if user
  false
end
