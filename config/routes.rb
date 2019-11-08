Rails.application.routes.draw do
  resources :users, only: %i[index show new create]
  resources :posts
end
