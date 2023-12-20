Rails.application.routes.draw do
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users" => "users#update"
  delete "/users" => "users#destroy"

  post "/sessions" => "sessions#create"
end
