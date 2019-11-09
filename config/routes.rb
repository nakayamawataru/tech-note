Rails.application.routes.draw do

  get "users/:id" => "users#show"
  get "signup" => "users#new"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "/" => "home#index"
  
  
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
