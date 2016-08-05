Rails.application.routes.draw do
  resources :users
  get 'logout' => 'users#logout'
  root 'home#index'
end
