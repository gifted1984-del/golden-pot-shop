Rails.application.routes.draw do
  get "admin/login", to: "admin/sessions#new", as: :admin_login
  post "admin/login", to: "admin/sessions#create"
  delete "admin/logout", to: "admin/sessions#destroy", as: :admin_logout

  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :products, except: :show
  end
  resources :products, only: %i[index show]
  get "checkout", to: "checkout#new"
  post "checkout/preview", to: "checkout#preview", as: :checkout_preview
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "products#index"
end
