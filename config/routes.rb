SampleApp::Application.routes.draw do

  resources :microposts do
    resources :post_comments
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy, :show]
  resources :baners,    only: [:show]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/news', to: 'news_posts#index', via: 'get'
  resources :categories, only: [:show]
  resources :news_posts, only: [:show]
  resources :post_comments, only: [:show]
end
