class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :subject, {null: false}
      t.integer :creator_id, {null: false}

      t.timestamps(null: false)
    end
  end
end
