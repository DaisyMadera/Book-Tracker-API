Rails.application.routes.draw do
  namespace :api do
    get "/", to: "root#root"

    get "books/options", to: "books#options"
    get "books/new", to: "books#new"
    post "books", to: "books#create"
    get "books/:id/edit", to: "books#edit"

    post "books/:id/update", to: "books#update"
    post "books/:id/delete", to: "books#destroy"

    get "books/:id", to: "books#show"
    get "books", to: "books#index"
  end
end