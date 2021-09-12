Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :taught_classes do
    resources :class_memberships, only: [ :create ]
    resources :assignments, only: [ :new, :create, :show, :update, :delete, :index ], shallow: true
  end

  resources :class_memberships, only: [ :index ]

  get '/dashboard', to: 'pages#dashboard'
end
