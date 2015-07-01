Rails.application.routes.draw do
  root               "static_pages#home"

  get "help"      => "static_pages#help"
  get "about"     => "static_pages#about"
  get "contact"   => "static_pages#contact"
  get "signup"    => "users#new"
  get "login"     => "sessions#new"
  post "login"    => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :lessons, only: [:create, :show]
  resources :lesson_words, only: [:show, :edit, :update]

  get "/users/:id/:type" => "relationships#index", as: "follow"

  namespace :admin do
    root "dashboard#index"
    resources :categories
    resources :words
  end
end
