Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [ :show, :index ] do
    resources :posts, only: [ :show, :index ] do 
    end
  end
  get "/posts/new", to: "posts#new", as: 'posts_new'
  post "posts", to: 'posts#create', as: 'posts_create'
  post 'comments/:user_id/:post_id', to: 'comments#create', as: 'comments_create'
end
