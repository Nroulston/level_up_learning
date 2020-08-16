class MemoryCard < ApplicationRecord
has_many :memory_decks
has_many :memory_cards, through: :memory_decks
end
