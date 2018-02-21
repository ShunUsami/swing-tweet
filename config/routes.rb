Rails.application.routes.draw do
    
    post "likes/:post_id/create" => "likes#create"
    post "likes/:post_id/destroy" => "likes#destroy"
    
    post "comments/:post_id/create" => "comments#create"
    post "comments/:id/destroy" => "comments#destroy"
    
    get "login" => "users#login_form"
    post "login" => "users#login"
    post "logout" => "users#logout"
    get "users/:id/likes" => "users#likes"
    
    post "users/:id/update" => "users#update"
    get "users/:id/edit" => "users#edit"
    post "users/create" => "users#create"
    get "signup" => "users#new"
    get 'users/index' => "users#index"
    get "users/:id" => "users#show"
    get 'posts/index' => "posts#index"
    get 'posts/new' => "posts#new"
    get 'posts/:id' => "posts#show"
    post 'posts/create' => "posts#create"
    post "posts/:id/update" => "posts#update"
    post "posts/:id/destroy" => "posts#destroy"
    get "posts/:id/edit" => "posts#edit"
    get '/' => "home#top"
    get "users/index" => "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
