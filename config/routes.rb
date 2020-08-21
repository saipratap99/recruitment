Rails.application.routes.draw do
  post "user_questions/score/:id", to: "user_questions#save_score", as: :save_score
  get "user_questions/index", to: "user_questions#index", as: :questions
  root to: "users#new"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
