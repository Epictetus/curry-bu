Currybu::Application.routes.draw do
  resources :items

  resources :shops

  devise_for :users
  as :user do
    get '/settings/account' => 'registrations#edit'
    put '/settings/account' => 'registrations#update'
  end

  resources :users, only: [:index, :show]

  root :to => 'home#index'
end
