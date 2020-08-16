class CreateMemoryDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :memory_decks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :memory_card, null: false, foreign_key: true
      t.integer :interval_counter
      t.datetime :date_of_next_practice
      t.timestamps
    end
  end
end
