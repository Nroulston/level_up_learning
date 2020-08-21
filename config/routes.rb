Rails.application.routes.draw do
  resources :memory_cards, only: [:index, :show, :new, :create, :edit, :update]
  
  resources :memory_decks do
    resources :memory_cards, only: [:new, :create]
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  resources :users, only: [] do
    resources :memory_decks, only: [:index, :new]
    resources :memory_cards, only: :index
  end

  
  resources :training

  

  
  root "training#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end

