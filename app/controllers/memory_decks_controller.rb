class MemoryDecksController < ApplicationController

  def index
      raise params.inspect
      if params[:user_id]
        @decks = User.find(params[:user_id]).memory_decks

      end

  end
  
  def new

  end

  def create

  end

  def update

  end
end
