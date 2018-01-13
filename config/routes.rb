Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :user_sessions, only: [:create]

  get 'sign_up' => 'users#new', as: :sign_up
  get 'sign_in' => 'user_sessions#new', as: :sign_in
  post 'logout' => 'user_sessions#destroy', as: :sign_out
end
