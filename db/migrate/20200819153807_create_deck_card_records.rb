class CreateDeckCardRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :deck_card_records do |t|
      t.belongs_to :memory_deck, null: false, foreign_key: true
      t.belongs_to :memory_card, null: false, foreign_key: true
      t.datetime :practice_date
      t.integer :practice_interval_counter

      t.timestamps
    end
  end
end
