Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: "/jobs"

  resources :participants
  resource :password, only: [:edit, :update]
  resources :password_resets, only: [:new, :edit, :create, :update], param: :token
  resources :payments, only: [:new, :create]
  resource :profile, only: [:show]
  resource :session, only: [:create, :destroy]
  resources :users, only: [:create, :show, :edit, :update, :destroy]

  get :login, to: "sessions#new"
  delete :logout, to: "sessions#destroy"
  get :signup, to: "users#new"

  get :register, to: "registrations#new"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker

  # Defines the root path route ("/")
  root "static_pages#home"
end
