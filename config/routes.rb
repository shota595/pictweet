Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts, only: [:new, :show, :create, :index] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
