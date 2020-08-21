Rails.application.routes.draw do
  get "user_questions/index", to: "user_questions#index", as: :questions
  root to: "users#new"
  resources :users
  resources :user_questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
