Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  root "groups#index"
  resources :users, only: [:index, :edit, :update, :destroy]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

  resources :posts  do
    resources :comments
  end
end
