Rails.application.routes.draw do
  get 'advice/index'

  get 'sessions/new'

  get 'users/new'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'home' => 'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'index' => 'users'
  get 'new_guide' => 'guides#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  root 'static_pages#home'
  resources :users
  resources :guides do
    resources :advice
  end
end
