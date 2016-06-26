Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  root 'static_pages#home'
  resources :users
end
