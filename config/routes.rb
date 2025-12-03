Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Allow GET requests for sign out (in addition to DELEE which is already built in in devise_for:users) as we want to get back to the home page after signing out
  devise_scope :user do
   get "/users/sign_out", to: "devise/sessions#destroy"
  end


  resources :workout_plans do
    resources :ai_messages, only: [:index, :create]
    resources :workout_exercises, except: [:index, :show]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
