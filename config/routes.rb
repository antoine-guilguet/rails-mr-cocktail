Rails.application.routes.draw do

  get 'pages/home'

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy, :edit, :update]
    resources :reviews, only: [:new, :create, :destroy]
  end
  root 'pages#home'
end
