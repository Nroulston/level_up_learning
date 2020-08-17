class MemoryCardsController < ApplicationController
  before_action :set_memory_card, only: [:show, :edit, :delete, :update]

  def index
    @memory_cards = MemoryCard.all
  end
  
  def new
    if params[:memory_deck_id]
        @deck = MemoryDeck.find(params[:memory_deck_id])
        @card = MemoryCard.new
   
    else
        @card = MemoryCard.new
    end
  end
  
  def create
    raise params.inspect
  end


  private
  def set_memory_card
    @memory_card = MemoryCard.find(params[:id])
  end

end
