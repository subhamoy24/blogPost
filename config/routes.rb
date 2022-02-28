Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "user/login", to: "users#login", as: "user_login"
  get "user/register", to: "users#register", as: "user_register"
  
  namespace :admins do
    get "home", to: "home", as: "home"
  end

  scope :admin do
    resources :categories
  end

  post "user/generate", to: "users#post_register", as: "user_register_post"
  post "user/authorize", to: "users#authorize", as: "user_authorize"

end
#rails g scaffold Widget name:string price:decimal