Rails.application.routes.draw do
  # users routes
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users" => "users#update"
  delete "/users" => "users#destroy"

  # sessions routes
  post "/sessions" => "sessions#create"

  # groups routes
  get "/groups" => "groups#index"
  get "/groups/:id" => "groups#show"
  post "/groups" => "groups#create"
  patch "/groups" => "groups#update"
  delete "/groups" => "groups#destroy"
end
