Rails.application.routes.draw do

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/index'

  resources :tourneys do
    resources :matches
  end

  resources :teams do
    resources :players
  end

  resources :foros do 
    resources :topics    
  end

  resources :topics do 
    resources :comments    
  end

  resources :users

  resources :requests

  resource :session, only: [:new, :create, :destroy]

end
