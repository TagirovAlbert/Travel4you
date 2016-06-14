Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :photo_reports do
    resources :images, :only => [:create, :destroy, :index, :edit]
  end
  resources :places, :only => [:new,:create]
  resources :countries, :only => [:show, :index] do
    resources :regions do
      resources :cities do
        resources :places, :only => [:show]
      end
    end
  end
  match '/test', to: 'countries#test', via: 'get'
  match '/about', to: 'pages#about_us', via: 'get', :as => :about
  match '/planet', to: 'cities#index', via: 'get', :as => :planet
  match '/profile', to: 'pages#profile', via: 'get', :as => :profile
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth/omniauth_callbacks', registrations: 'registrations' }
  match '/users/:login', to: 'profiles#show_profiles', via: 'get', :as => :users_show
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch, :put], :as => :finish_signup
  root to: "pages#home"
end
