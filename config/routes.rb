Rails.application.routes.draw do

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]do
     member do
     get :following, :followers, :show_follow
    end
  end
  resource :relationships,only: [:create, :destroy]

  resources :books do
      resource :favorites, only: [:create, :destroy]
      resource :book_comments, only: [:create, :destroy]
end

  root 'home#top'
  get 'home/about'
end