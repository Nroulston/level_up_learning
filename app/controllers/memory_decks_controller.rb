class MemoryDecksController < ApplicationController
  
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  def index
    
      if params[:user_id] && current_user.id == params[:user_id]
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
    #Add autofill with jquery or stimuluous. 
    @deck = current_user.memory_decks.find_or_create_by(deck_params)
     
    if @deck.save
      redirect_to user_memory_decks_path(current_user)
      
    else
      #add flash message for error of wrong type of name
      render :new
    end

  end

  def edit
    if current_user == @deck.user
      render :edit
    else
      flash[:alert] = "You don't have access to that Deck. Sign in to your account to see it."
      redirect new_user_session_path
    end
  end

  def update
    if @deck.update(deck_params) 
      redirect_to memory_deck_path(@deck)
    else
      render :edit
    end
  end

  def destroy
    if current_user == @deck.user
      @deck.destroy
      flash[:notice] = "deck deleted successfully "
      redirect_to user_memory_decks_path(current_user)
    else
      flash[:alert] = "You don't have access to that deck. Sign in to your account to see it."
      redirect_to new_user_session_path
    end
  end

  private

  def set_deck
    @deck = MemoryDeck.find_by(id: params[:id])
  end

  def deck_params
    params.require(:memory_deck).permit(:title)
  end
end
