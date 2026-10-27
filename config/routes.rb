Rails.application.routes.draw do

  root "products#index"

  resources :products, only: [
    :index,
    :new,
    :create,
    :destroy
  ]

  resource :cart, only: [:show]

  resources :cart_items, only: [
    :create,
    :destroy
  ]

end