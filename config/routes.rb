Rails.application.routes.draw do

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy, :edit, :update]
    resources :reviews, only: [:new, :create, :destroy]
  end
  root 'cocktails#index'
end
