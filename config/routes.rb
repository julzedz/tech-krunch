Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [ :show, :index ] do
    get "posts/new", to: "posts#new", as: 'posts_new'
    resources :posts, only: [ :show, :index ] do 
      resources :likes, only: [:create]
    end
  end
  post "posts", to: 'posts#create', as: 'posts_create'
  post 'comments/:user_id/:post_id', to: 'comments#create', as: 'comments_create'
end
