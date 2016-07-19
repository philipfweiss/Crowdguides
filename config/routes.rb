Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

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
  get 'new_tidbit' => 'tidbits#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'static_pages#home'

  resources :users
  resources :guides do
    resources :advice
  end
  resources :tidbits

end
