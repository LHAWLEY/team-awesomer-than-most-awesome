class AddPublicColumnToDecks < ActiveRecord::Migration
  def change
  	add_column :decks, :is_public, :boolean, default: true
  end
end
