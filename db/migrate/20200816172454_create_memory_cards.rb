class CreateMemoryCards < ActiveRecord::Migration[6.0]
  def change
    create_table :memory_cards do |t|
      t.string :question
      t.string :answer
      t.timestamps
    end
  end
end
