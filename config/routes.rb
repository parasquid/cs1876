ParasquidCs1876::Application.routes.draw do
  get "home/index"

  match 'admin' => 'admin#index'
  post 'admin/seed'
  post 'admin/clear'
  post 'properties/search', as: :searches_path

  resources :properties

  root to: 'home#index'
end
