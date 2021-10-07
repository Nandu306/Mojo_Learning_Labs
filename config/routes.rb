Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :taught_classes do
      get '/class_students', to: 'taught_classes#class_students'
      resources :class_memberships, only: [ :create ], shallow: true
      resources :assignments, shallow: true do
          # member do
          #   post 'publish', to: 'assignments#publish'
          # end
      end
    end


  resources :class_memberships, only: [ :index ]

  get '/dashboard', to: 'pages#dashboard'
  get '/my_assignments', to: 'assignments#my_assignments'
end
