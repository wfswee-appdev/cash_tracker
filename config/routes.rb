Rails.application.routes.draw do
  root "transactions#index"

  devise_for :users

  resources :transactions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  
end
