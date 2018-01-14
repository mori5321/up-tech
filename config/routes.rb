Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create]
  resources :menu, only: :index

  resources :tasks, only: [:new, :create, :show] do
    collection do
      get 'monthly'
      get 'weekly'
      get 'daily'
    end
  end

  # adminがUserを作成する仕様かと判断しこめんとアウト
  # get 'sign_up' => 'users#new', as: :sign_up
  get 'sign_in' => 'user_sessions#new', as: :sign_in
  post 'logout' => 'user_sessions#destroy', as: :sign_out
end
