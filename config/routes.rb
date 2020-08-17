Rails.application.routes.draw do
  resources :memory_cards
  root "memory_cards#index"
  resources :memory_decks, only: [:index, :show, :new, :create, :edit, :update]
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [] do
    resources :memory_decks
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end


#TODO refactor secrets to .env file
#TODO nested routes to create memory cards
#TODO validate information inputs
#TODO scope methods to show only memory cards that are in a deck show page

#TODO write the logic to advance memory cards show_dates
#TODO scope method in training controller to show the cards that need to be practiced. 
