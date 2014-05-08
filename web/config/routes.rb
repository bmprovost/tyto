Rails.application.routes.draw do
  resources :students, :teachers
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions

  root 'static_pages#home'

  post '/students', to: 'students#create'

  match '/teachersignup', to: 'teachers#new', via: 'get'

  match '/studentsignup', to: 'students#new', via: 'get'

  match '/signin', to: 'sessions#new', via: 'get'

  match '/signout', to: 'sessions#destroy', via: 'delete'
end
