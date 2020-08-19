class TrainingController < ApplicationController
  
  def index  

   @cards = cards_needing_practiced 
    
  end
 
  def new
    card_to_practice
    
  end

  def show

  end

  
  private
  
  def cards_needing_practiced
    current_user.cards_needing_practice ||= current_user.memory_cards.joins(:deck_card_records).where("deck_card_records.practice_date <= 'Time.now'")
  end
  
  def first_card_to_practice
    @card = cards_needing_practiced
  end
  
  
end
