class TrainingController < ApplicationController
  before_action :set_card_for_practice, only: [:new, :show, :update]
  before_action :set_cards_for_practice, only: [:index, :update]

  def index  
    set_cards_for_practice
  end
 
  def new
  end

  def show
  end

  def update
    current_record = DeckCardRecord.joins(memory_card: :users).where(memory_card: @card).first
    if params[:advance_card]

     current_record.practice_interval_counter = Training.practice_interval_steps[Training.practice_interval_steps.index(current_record.practice_interval_counter) + 1]

     current_record.practice_date = Time.now.next_day(current_record.practice_interval_counter)

     @cards.delete_at(0)

     
    else
      current_record.practice_interval_counter = Training.card_advancement_steps[0]
      
      @cards << @cards.shift
    end
    current_record.save
    redirect_to new_training_path
  end

  private 
  def set_cards_for_practice
  current_user.cards_to_practice
   @cards ||= current_user.cards_needing_practice
  end

  def set_card_for_practice
    @card = current_user.card_to_practice
  end
end
