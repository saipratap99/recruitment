Rails.application.routes.draw do
  post "user_questions/score/:id", to: "user_questions#save_score", as: :save_score
  get "user_questions/index", to: "user_questions#index", as: :questions
  post "user_questions/calculate", to: "user_questions#calculate_score", as: :calculate_score
  get "add/question", to: "users#question", as: :question
  post "add/question", to: "users#add", as: :add_question
  get "users/performance", to: "users#performance", as: :performance
  root to: "users#new"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
