Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do 
    namespace :v1 do 
      resources :assessments, only: [:create, :index, :show ,:destroy] do
        resources :questions, only: [:create, :index, :show] do
          resources :options, only: [:create, :index, :show] 
        end
        resources :responses, only: [:create, :index]
      end
      resources :performances, only: [:create] do
        member do
          post 'calculate_score'
        end
      end
    end 
  end 
  # post 'responses', to: "responses#create"
end 