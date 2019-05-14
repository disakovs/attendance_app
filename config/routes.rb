Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'classrooms#index'
  
  get 'allstudents', to: 'students#index'
  get 'allstudents/search', to: 'students#search'
  
  resources :classrooms do
    resources :students, except: [:index] 
  end
  
  resources :teachers
  resources :attendances, except: [:destroy]
  resources :users, only: [:index, :create, :edit, :update]
  
  #login paths:
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
