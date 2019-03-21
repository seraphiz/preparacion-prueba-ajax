Rails.application.routes.draw do
  resources :posts
  devise_for :users
  get 'busqueda', to: 'posts#busqueda'
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
