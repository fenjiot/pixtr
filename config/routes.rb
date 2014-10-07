Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  root "galleries#index"

  resources :users, only: [:new, :create]

  resources :galleries do
    resources :images, only: [:show, :new, :create, :edit, :update]
  end

  resources :images, only: [] do
    resources :comments, only: [:create]
  end

  resources :groups, only: [:index, :new, :create, :show] do
    resources :group_memberships, only: [:create, :destroy]
  end
end
