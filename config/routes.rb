Currybu::Application.routes.draw do

  resources :items do
    resources :item_comments, path: "comments", only: [ :create, :destroy ]
  end

  resources :shops

  devise_for :users, skip: [ :sessions, :registrations ]
  as :user do
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session
    get '/signup' => 'registrations#new', as: :new_user_registration
    post '/signup' => 'registrations#create', as: :user_registration
    get '/settings/account' => 'registrations#edit'
    put '/settings/account' => 'registrations#update'
    delete '/settings/account' => 'registrations#destroy'
  end

  get '/settings/mail' => 'settings#mail_edit'
  put '/settings/mail' => 'settings#mail_update'

  resources :users, only: [:index, :show]

  root :to => 'home#index'
end
