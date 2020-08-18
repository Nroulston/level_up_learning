class MemoryDeck < ApplicationRecord
  belongs_to :user
  belongs_to :memory_card, optional: true

  validates :title, presence: true
  
end
