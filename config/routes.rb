Rails.application.routes.draw do

  get "users/show"=>"users#show"

  get "/"=>"home#top"
  
  get "posts/new"=>"posts#new"
  get "posts/:id"=>"posts#show"
  post "posts/create"=>"posts#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
