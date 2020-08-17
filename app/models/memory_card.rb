class MemoryCard < ApplicationRecord
has_many :memory_decks
has_many :users, through: :memory_decks

end
