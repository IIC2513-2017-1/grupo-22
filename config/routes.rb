Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  resources :tourneys do
    post "add_team"
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

  resources :comments

  resources :users

  resources :requests

  resource :session, only: [:new, :create, :destroy]

end
