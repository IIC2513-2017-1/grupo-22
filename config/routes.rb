Rails.application.routes.draw do

  get 'welcome/index'

  resources :tourneys do
    resources :matches
  end

  resources :teams do
    resources :players
  end

  resources :users

  resources :requests



  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
