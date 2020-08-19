class MemoryCard < ApplicationRecord
has_many :deck_card_records
has_many :memory_decks, through: :deck_card_records

has_many :users, through: :memory_decks
validates :question, presence: true
validates :answer, presence: true
end
