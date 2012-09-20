SignOn::Application.routes.draw do
  
  # scope constraints: lambda { |r| r.env['warden'].user.nil? } do
  #   get 'signup' => 'users#new', as: :signup
  #   get 'signin' => 'sessions#new', as: :signin
  # end
  
  get 'signup' => 'users#new', as: :signup
  get 'signin' => 'sessions#new', as: :signin
  
  get 'signout' => 'sessions#destroy', as: :signout
  
  root to: 'sessions#new'
  
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  
end
