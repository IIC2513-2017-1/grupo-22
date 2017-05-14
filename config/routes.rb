Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  resources :tourneys do
    resources :matches, only: [:create, :destroy]
    resources :participants, only: [:create, :destroy]
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

  resources :matches, only: [:index]

  match '*path' => redirect('/'), via: :get
end
