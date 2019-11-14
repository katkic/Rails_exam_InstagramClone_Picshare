Rails.application.routes.draw do
  root to: 'top#index'
  resources :users, only: %i[index show new create]

  resources :posts do
    collection do
      post :confirm
    end
  end

  resource :session, only: %i[new create destroy]
  resource :account, only: %i[show edit update destroy]
end
