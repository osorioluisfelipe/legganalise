Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :requests do
    resources :samples, only: [:new, :create]
  end
  resources :samples, only: :destroy do
    resources :sample_analyses, only: [:new, :create]
  end
end
