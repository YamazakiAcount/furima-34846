Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :items do
    resources :records, only: [:index, :create]
  end
end
