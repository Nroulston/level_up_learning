class TrainingController < ApplicationController
  before_action :set_card_for_practice, only: [:new, :show, :update]

  def index  
    current_user.cards_needing_practiced 
  end
 
  def new
  end

  def show
  end

  def update
    if params[:advance_card]
     current_record = DeckCardRecord.joins(memory_card: :users).where(memory_card: @card).first
     
     current_record.practice_interval_counter = Training.card_advancement_steps[Training.card_advancement_steps.index(current_record.practice_interval_counter) + 1]
      byebug
    end
  end

  private 

  def set_card_for_practice
    @card = current_user.card_to_practice
  end
end
