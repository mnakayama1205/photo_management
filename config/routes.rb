Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#show'

  resource :top, only: [:show] do
    member do
      post 'login'
    end
  end
end
