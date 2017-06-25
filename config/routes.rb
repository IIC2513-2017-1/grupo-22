Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  resources :tourneys do
    resources :matches, only: [:create, :destroy, :edit]
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

  resources :matches

  resource :session, only: [:new, :create, :destroy]

  match '*path' => redirect('/'), via: :get

  namespace :api do
    namespace :v1 do
      resources :teams, only: [:index, :show, :create]
      resources :users, only: [:show]
    end
  end

end
