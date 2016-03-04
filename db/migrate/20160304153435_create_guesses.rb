class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer  :card_id, null: false
      t.integer  :round_id, null: false
      t.boolean  :status, default: false
    end
  end
end
