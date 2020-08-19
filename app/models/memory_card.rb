class MemoryCard < ApplicationRecord
has_many :deck_card_records
has_many :memory_decks, through: :deck_card_records

validates :question, presence: true
validates :answer, presence: true
end
