Rails.application.routes.draw do
  resources :resumes
  resources :companies do
    resources :job_listings
  end
  resources :profiles, only: [ :edit, :update ]
  devise_for :users, path: "", controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }, path_names: {
    sign_in: "sign_in",
    sign_out: "sign_out",
    sign_up: "sign_up",
    password: "forgot_password", # Defines the base path for password actions
    new_password: "forgot_password", # Specifies `new` action to use /forgot_password
    confirmation: "confirmation" # Custom path for confirmation
  }
  root "static#home"
  get "about", to: "static#about"

  get "contact", to: "static#contact"
  get "faq", to: "static#faq"
  get "dashboard", to: "static#dashboard", as: "dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
