class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  belongs_to :creator, class_name: "User"
end
