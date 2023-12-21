Rails.application.routes.draw do
  # users routes
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  # sessions routes
  post "/sessions" => "sessions#create"

  # groups routes
  get "/groups" => "groups#index"
  get "/groups/:id" => "groups#show"
  post "/groups" => "groups#create"
  patch "/groups/:id" => "groups#update"
  delete "/groups/:id" => "groups#destroy"

  # messages routes
  get "/messages" => "messages#index"
  get "/messages/:id" => "messages#show"
  post "/messages" => "messages#create"
  patch "/messages/:id" => "messages#update"
  delete "/messages/:id" => "messages#destroy"
end
