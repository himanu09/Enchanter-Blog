Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index" #path in root generally make first page while we open web application.

  resources :articles do
    resources :comments
  end

  # get "/articles", to: "articles#index" #path that triggers articles controller index action
  get "/user", to: "users#show"

  Rails.application.routes.draw do
    if Rails.env.development?
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    end
    post "/graphql", to: "graphql#execute"
end
end
