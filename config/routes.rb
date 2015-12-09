Rails.application.routes.draw do
  match '/about', to: 'static_pages#about_us', via: 'get', :as => :about
devise_for :users, controllers: { omniauth_callbacks: 'omniauth/omniauth_callbacks', registrations: 'registrations' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch, :put], :as => :finish_signup
  root to: "pages#home"
end
