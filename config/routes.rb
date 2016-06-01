Rails.application.routes.draw do
  resources :places
  resources :countries do
    resources :regions do
      resources :cities do
        resources :photo_reports do
          resources :images, :only => [:create, :destroy]
        end

      end
    end
  end
  match '/test', to: 'countries#test', via: 'get'
  match '/about', to: 'static_pages#about_us', via: 'get', :as => :about
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth/omniauth_callbacks', registrations: 'registrations' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch, :put], :as => :finish_signup
  root to: "pages#home"
end
