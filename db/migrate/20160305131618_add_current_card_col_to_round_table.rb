class AddCurrentCardColToRoundTable < ActiveRecord::Migration
  def change
    add_column :rounds, :current_card, :integer
  end
end
