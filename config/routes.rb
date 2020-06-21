Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [] do
    resources :photos, only: [:index, :new, :create] do
      resource :tweets, only: [:create]
    end
  end

  get '/oauth/callback'
end
