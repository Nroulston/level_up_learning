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
    current_record = DeckCardRecord.joins(memory_card: :users).where(memory_card: @card).first
    if params[:advance_card]

     current_record.practice_interval_counter = Training.practice_interval_steps[Training.practice_interval_steps.index(current_record.practice_interval_counter) + 1]

     current_record.practice_date = Time.now.next_day(current_record.practice_interval_counter)

     current_user.cards_needing_practice.delete_at(0)

     if current_user.cards_needing_practice.blank?
      current_user.cards_needing_practice = nil
     end

     
    else
      current_record.practice_interval_counter = Training.practice_interval_steps[0]
      
      current_user.cards_needing_practice << current_user.cards_needing_practice.shift
    end
    current_user.save
    current_record.save
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
