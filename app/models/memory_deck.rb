class MemoryDeck < ApplicationRecord
  belongs_to :user
  has_many :deck_card_records
  has_many :memory_cards, through: :deck_card_records

  validates :title, presence: true
  validates_format_of :title, with: /\A[^`!@#\$%\^&*+_=\d']+\z/
end
