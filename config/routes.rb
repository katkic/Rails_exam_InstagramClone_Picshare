Rails.application.routes.draw do
  root to: 'top#index'
  resources :users, only: %i[index show new create]

  resources :posts do
    collection do
      post :confirm
    end
  end

  resource :session, only: %i[new create destroy]
  resources :accounts, only: %i[show edit update destroy]
  resources :favorites, only: %i[index create destroy]

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
