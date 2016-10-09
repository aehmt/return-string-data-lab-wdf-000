Rails.application.routes.draw do
  get 'home', to: 'static#home'
  get '/products/:id/inventory', to: 'products#inventory'
  get '/products/:id/description', to: 'products#description'
  get '/products/:id/price', to: 'products#price'
  resources :orders
  resources :invoices
  resources :products
end
