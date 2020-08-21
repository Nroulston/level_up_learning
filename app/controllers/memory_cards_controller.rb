class MemoryCardsController < ApplicationController
  
  
  before_action :set_memory_card, only: [:show, :edit, :delete, :update]

  def index
    @memory_cards = MemoryCard.all
    if params[:user_id] && params[:user_id].to_i == current_user.id
      @user = current_user
      @user_cards = current_user.memory_cards
    end
  end
 
  def show
    if params[:memory_deck_id]
    set_memory_deck
    end
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
        record.update(practice_date: Time.now, practice_interval_counter: 0)
  
        redirect_to memory_deck_path(@deck)
      else
        render :new
      end
    end
  end

  def edit
    # if current_user == @card.user
    #   render :edit
    # else
    #   flash[:alert] = "You don't have access to that card. Sign in to your account to see it."
    #   redirect new_user_session_path
    # end
  end

  def update
    if @card.update(memory_card_params)
      redirect_to @card
    else
      render :edit
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
    @card = MemoryCard.find(params[:id])
  end

end
