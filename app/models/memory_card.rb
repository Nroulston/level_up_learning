class MemoryCard < ApplicationRecord
has_many :memory_decks
has_many :users, through: :memory_decks

validates :question, presence: true
validates :answer, presence: true
end
