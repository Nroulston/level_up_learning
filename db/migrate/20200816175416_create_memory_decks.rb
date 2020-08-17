class CreateMemoryDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :memory_decks do |t|
      t.string :title
      t.integer :interval_counter
      t.datetime :date_of_next_practice
      t.references :user, null: false, foreign_key: true
      t.integer :memory_card_id
      t.timestamps
    end
  end
end
