class Training < ApplicationRecord

  @@card_advancement_steps = [0,1,7,16,35,70]

def self.card_advancement_steps
  @@card_advancement_steps
end

def cards_needing_practiced
  current_user.cards_needing_practice ||= current_user.memory_cards.joins(:deck_card_records).where("deck_card_records.practice_date <= 'Time.now'")
  current_user.save
end

def card_to_practice
  if cards_needing_practiced
    @card ||= current_user.cards_needing_practice.first
  end
end
end
