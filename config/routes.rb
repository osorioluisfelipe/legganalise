Rails.application.routes.draw do
  root to: 'pages#home'
  get '/user' => 'requests#index', :as => :user_root
  post '/requests/:id', to: 'requests#update', as: :update_request
  devise_for :users
  resources :requests, except: [:update] do
    resources :samples, only: [:new, :create]
  end
  resources :samples, only: :destroy do
    resources :sample_analyses, only: [:new, :create]
  end
end
