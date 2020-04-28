Rails.application.routes.draw do
  namespace :users do
    get 'bodies/new'
  end
  resources :meetings
  root to: 'users/home#top'
  
  get 'posts/show'

  devise_for :admin
    namespace :admin do
    get 'top' => 'home#top'
  resources :home, only: [:index]



  end

  devise_for :users
  root 'users#index'
   scope module: :users do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  resources :bodies, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  resources :relationships, only: [:show, :index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
