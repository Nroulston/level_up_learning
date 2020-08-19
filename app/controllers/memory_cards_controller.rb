class MemoryCardsController < ApplicationController
  before_action :set_memory_card, only: [:show, :edit, :delete, :update]

  def index
    @memory_cards = MemoryCard.all
  end
  
  def new
    if params[:memory_deck_id]
       set_memory_deck
        new_memory_card
    else
        new_memory_card
    end
  end
  
  def create

    if params[:memory_deck_id]
      
      set_memory_deck
      
      @card = @deck.memory_cards.build(memory_card_params)
      
      if @deck.save 
        record = DeckCardRecord.last
        record.update(practice_date: DateTime.now, practice_interval_counter: 0)
       
        redirect_to memory_deck_path(@deck)
      else
        render :new
      end

    
    end
  end


  private
  def new_memory_card
    @card = MemoryCard.new
  end

  def set_memory_deck
    @deck = MemoryDeck.find(params[:memory_deck_id])
  end

  def memory_card_params
    params.require(:memory_card).permit(:question, :answer)
  end
  def set_memory_card
    @memory_card = MemoryCard.find(params[:id])
  end

end
