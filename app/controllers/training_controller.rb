class TrainingController < ApplicationController
 
  before_action :set_card_for_practice, only: [:new, :show, :update]
  before_action :set_cards_for_practice, only: [:update]

  def index  
     set_cards_for_practice
  end
 
  def new
  end

  def show  
  end

  def update
    @current_record = DeckCardRecord.record_of_users_memory_card(@card)
    
    Training.advance_card_in_interval_set_or_reset_to_zero(params, @current_record, current_user)
    
    
    if current_user.cards_needing_practice
      redirect_to new_training_path
    else
      redirect_to root_path
    end
  end

  private 
  def set_cards_for_practice
  current_user.cards_to_practice
  @cards = current_user.cards_needing_practice
  end

  def set_card_for_practice
    @card = current_user.card_to_practice
  end
end
