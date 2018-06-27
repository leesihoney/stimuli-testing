Rails.application.routes.draw do
  resources :recipients
  resources :questions
  resources :users
  resources :sessions
  resources :results
  resources :errors

  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
