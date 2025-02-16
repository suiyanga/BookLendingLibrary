Rails.application.routes.draw do
  root "books#index"

  # Ensure Devise is properly loaded
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }





  # Only include users#show, no manual sign_out (handled by Devise)
  resources :users, only: [ :show ]

  resources :books, only: [ :index, :show ] do
    member do
      post "borrow"
      patch "return"
    end
    resources :reviews, only: [ :create ]
  end
end
