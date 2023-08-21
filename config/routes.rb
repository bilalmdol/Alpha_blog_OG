Rails.application.routes.draw do
  # resources :employees
  resources :users
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles
end
