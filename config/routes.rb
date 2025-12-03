Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :workout_plans do
    resources :chats, only: [:show, :create] do
      resources :ai_messages, only: [:create]
    end

    resources :workout_exercises, except: [:index, :show]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
