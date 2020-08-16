class MemoryDeck < ApplicationRecord
  belongs_to :user
  belongs_to :memory_card
end
