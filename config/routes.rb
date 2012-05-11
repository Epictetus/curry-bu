Currybu::Application.routes.draw do
  resources :items

  resources :shops

  devise_for :users

  resources :users, only: [:index, :show]

  root :to => 'home#index'
end
