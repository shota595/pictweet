Rails.application.routes.draw do
  root 'posts#index'
  get 'users/:id/followers' => "users#followers", as: "followers"
  get 'users/:id/followings' => 'users#followings', as: "followings"
  devise_for :users
  resources :posts, only: [:new, :show, :create, :index] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
      get :following, on: :member
      get :follower, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
