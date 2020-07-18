Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users,only: [:show,:edit,:update,:confirm] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'home#top'
resources :movies
resource :favorites, only: [:create, :destroy]
resource :movie_comments, only: [:create, :destroy]
end
