Rails.application.routes.draw do
  root to: 'users/home#top'
  
  get 'posts/show'
  devise_for :admins
    namespace :admin do
  	  get 'top' => 'home#top'

  end

  devise_for :users
   scope module: :users do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

end
