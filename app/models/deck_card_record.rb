class DeckCardRecord < ApplicationRecord
  belongs_to :memory_deck
  belongs_to :memory_card

end
