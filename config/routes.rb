Rails.application.routes.draw do

  get "users/:id" => "users#show"
  get "signup" => "users#new"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"

  get "/" => "home#top"
  
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/sedit" => "posts#edit"
  post "posts/:id/update" => "posts#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
