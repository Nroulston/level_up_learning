class TrainingController < ApplicationController
  
  def index  
    
    cards_needing_practiced 
  end
 
  def new
    card_to_practice
  end

  def show
    card_to_practice
  end

  def update
    if params[:advance_card]
    end
  end
end
