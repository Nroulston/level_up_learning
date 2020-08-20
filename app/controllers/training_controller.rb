class TrainingController < ApplicationController
  
  def index  
    cards_needing_practiced 
  end
 
  def new
    card_to_practice
  end

  def show
    card_to_practice
  end

  def update
    if params[:advance_card]
    end
  end
  private
  
  # def cards_needing_practiced
  #   current_user.cards_needing_practice ||= current_user.memory_cards.joins(:deck_card_records).where("deck_card_records.practice_date <= 'Time.now'")
  #   current_user.save
  # end
  
  # def card_to_practice
  #   if cards_needing_practiced
  #     @card ||= current_user.cards_needing_practice.first
  #   end
  # end
end
