Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :photo_reports do
    resources :images, :only => [:create, :destroy, :index]
  end
  resources :places, :only => [:new,:create, :index]
  resources :countries, :only => [:show, :index] do
    resources :regions do
      resources :cities do
        resources :places, :only => [:show]
      end
    end
  end
  match '/test', to: 'countries#test', via: 'get'
  match '/about', to: 'static_pages#about_us', via: 'get', :as => :about
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth/omniauth_callbacks', registrations: 'registrations' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch, :put], :as => :finish_signup
  root to: "pages#home"
end
