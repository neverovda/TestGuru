Rails.application.routes.draw do
  
  root 'tests#index'
  
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers
    end

    post :start, on: :member    

  end

  resources :test_passages, only: %i[show update] do
    
    get :result, on: :member

  end  

end
