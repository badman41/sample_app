Rails.application.routes.draw do
  get 'follow/following'
  get 'follow/follower'
  get "password_resets/new"
  get "password_resets/edit"
  scope "(:locale)", :locale => /en|vn/ do
    get "users/new"
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/help", to: "static_pages#help", as: "hefl"
    get "/contact", to: "static_pages#contact"
    get "/about", to: "static_pages#about"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "sessions/new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :microposts, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    get "following/:id", to:"follow#following", as: "following"
    get "followers/:id", to:"follow#followers", as: "followers"
  end
end
