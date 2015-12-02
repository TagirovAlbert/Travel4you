Rails.application.routes.draw do
  match '/about', to: 'static_pages#about_us', via: 'get', :as => :about

  devise_for :users
  root to: "pages#home"
end
