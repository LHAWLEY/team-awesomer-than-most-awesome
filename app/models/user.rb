require 'bcrypt'


class User < ActiveRecord::Base
  include BCrypt
#has_many :rounds
#has_many :decks
#has_many :guesses, through: :rounds

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(params)
    user = User.find_by(username: params[:username]) unless !params[:username]
    hashed_pw = Password.new(user.password_hash)
    if hashed_pw == params[:password]
      return true
    else
      return false
    end
  end


end
