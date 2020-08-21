class DeckCardRecord < ApplicationRecord
  belongs_to :memory_deck
  belongs_to :memory_card


  def self.record_of_users_memory_card(card)
    joins(memory_card: :users).where(memory_card: card).first
  end
end
