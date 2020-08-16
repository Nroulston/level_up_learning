class MemoryCardsController < ApplicationController
  before_action :set_memory_card, only: [:show, :edit, :delete, :update]

  def index
    @memory_cards = MemoryCard.all
  end




  private
  def set_memory_card
    @memory_card = MemoryCard.find(params[:id])
  end

end
