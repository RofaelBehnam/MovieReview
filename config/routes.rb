Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  post "/movies" => "movies#create"
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"
  put "/movies/:id" => "movies#update"
  delete "/movies/:id" => "movies#destroy"
  
  post "/movies/:id/filmings" => "filmings#create"
  get "/movies:id/filmings" => "filmings#index"
  get "/movies/:id/filmings/:id" => "filmings#show"
  put "/movies/:id/filmings/:id" => "filmings#update"
  delete "/movies/:id/filmings/:id" => "filmings#destroy"
  
  post "/movies/:id/reviews" => "reviews#create"
  get "/movies:id/reviews" => "reviews#index"
  get "/movies/:id/reviews/:id" => "reviews#show"
  put "/movies/:id/reviews/:id" => "reviews#update"
  delete "/movies/:id/reviews/:id" => "reviews#destroy"
end
