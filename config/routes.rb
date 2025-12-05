Rails.application.routes.draw do
  devise_for :users

  # All routes that depend on the Devise :user mapping
  devise_scope :user do
    # Default landing page: Devise sign-in screen
    root to: "devise/sessions#new"

    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  # Workout plans with nested chat and AI message handling
  resources :workout_plans do
    resources :chats, only: [:show, :create] do
      post 'revise_plan', on: :member
      resources :ai_messages, only: [:create]
    end

    resources :workout_exercises, except: [:index, :show]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
