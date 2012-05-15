Currybu::Application.routes.draw do
  resources :items

  resources :shops

  devise_for :users, skip: [ :sessions ]
  as :user do
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
    get '/settings/account' => 'registrations#edit'
    put '/settings/account' => 'registrations#update'
  end

  resources :users, only: [:index, :show]

  root :to => 'home#index'
end
