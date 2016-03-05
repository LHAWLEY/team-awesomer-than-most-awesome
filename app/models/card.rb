class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses, foreign_key: :card_id
end
