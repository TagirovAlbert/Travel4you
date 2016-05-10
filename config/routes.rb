Rails.application.routes.draw do
  resources :photo_reports
  resources :places
  resources :cities
  resources :countries do
    resources :images, :only => [:create, :destroy]
  end
  resources :regions
  match '/about', to: 'static_pages#about_us', via: 'get', :as => :about
devise_for :users, controllers: { omniauth_callbacks: 'omniauth/omniauth_callbacks', registrations: 'registrations' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch, :put], :as => :finish_signup
  root to: "pages#home"
end
