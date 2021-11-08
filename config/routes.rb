Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :samples
  resources :requests
  resources :lab_analysis
end
