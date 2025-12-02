Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :workout_plans do
    resources :ai_messages, only: [:index, :create]
    resources :workout_exercises, except: [:index, :show]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
