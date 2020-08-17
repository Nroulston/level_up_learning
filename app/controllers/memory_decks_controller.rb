class MemoryDecksController < ApplicationController

  before_action :set_deck, only: [:show, :edit, :update, :delete]
  def index
    
      if params[:user_id]
        @decks = User.find(params[:user_id]).memory_decks
      else
        @decks = MemoryDeck.all
      end
  end

  def show
  
  end
  
  def new
   @deck = MemoryDeck.new
  end

  def create
   
    @deck = current_user.memory_decks.build(deck_params)

    if @deck.save
      redirect_to user_memory_decks_path(current_user)
    else
      render :new
    end

  end

  def update

  end

  private

  def set_deck
    @deck = MemoryDeck.find(params[:id])
  end

  def deck_params
    params.require(:memory_deck).permit(:title)
  end
end
