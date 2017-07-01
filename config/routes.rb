Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  resources :tourneys do
    resources :matches, only: [:create, :destroy, :edit]
    resources :participants, only: [:create, :destroy]
  end

  resources :teams do
    resources :players, except: [:index]
  end

  resources :foros do
    resources :topics, except: [:index]
  end

  resources :topics do
    resources :comments, except: [:index]
  end

  resources :players, except: [:create, :destroy]

  resources :comments

  resources :users

  resources :requests

  resources :matches

  resources :search, only: [:index]

  resource :session, only: [:new, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :teams, only: [:index, :show, :create]
      resources :users, only: [:show]
      resources :tourneys, only: [:index, :show, :create]
      resources :matches, only: [:index]
    end
  end

  match '*path' => redirect('/'), via: :get

end
