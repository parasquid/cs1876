ParasquidCs1876::Application.routes.draw do
  get "home/index"

  match 'admin' => 'admin#index'
  post 'admin/seed'

  resources :properties

  root to: 'home#index'
end
