Rails.application.routes.draw do
  resources :memory_cards
  root "memory_cards#index"
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [] do
    resources :memory_decks
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
