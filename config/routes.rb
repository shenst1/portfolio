Todo::Application.routes.draw do
  resources :betausers
  resources :facebook_accounts
  resources :twitter_accounts

  mount Blogit::Engine => "/blog"

  #service routes

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" } do
    get '/users/auth/twitter/callback' => 'service_callbacks#twitter'
  end


  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      resource :session, only: [:create, :destroy]
    end
    resources :task_lists, only: [:index, :create, :update, :destroy, :show] do
      resources :tasks, only: [:index, :create, :update, :destroy]
    end
  end

  root :to => "templates#index"
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }
  get '/talks' => 'templates#index'
  get '/consulting' => 'templates#index'
  get '/contact' => 'templates#index'
  get '/blog' => 'templates#index'


end
