Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :taught_classes do
      get '/class_students', to: 'taught_classes#class_students'
      resources :class_memberships, only: [ :index, :create ], shallow: true
      resources :assignments, shallow: true do
          member do
            get 'new_completed_assignment', to: 'assignments#new_completed_assignment'
            post 'create_completed_assignment', to: 'assignments#create_completed_assignment'
            get 'show_completed_assignment', to: 'assignments#show_completed_assignment'
            get 'class_performance', to: 'assignments#class_performance'
          end
        resources :student_answers, shallow: true
      end
    end


  resources :class_memberships, only: [ :index ]
  resources :demo_requests, only: [ :new, :create ]

  # resources :completed_assignments, only: [:index, :show]

  get '/dashboard', to: 'pages#dashboard'
  get '/my_assignments', to: 'class_memberships#my_assignments'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
