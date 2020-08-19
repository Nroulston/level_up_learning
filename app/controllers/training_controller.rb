class TrainingController < ApplicationController
  
  def index  
    @needs_practicing = cards_needing_practiced
  end
 

  
  private
  
  def cards_needing_practiced
    @@cards ||= current_user.memory_cards.joins(:deck_card_records).where("deck_card_records.practice_date <= 'Time.now'")
  end

  
  
end
