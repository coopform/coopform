Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/activated/:id', to: 'welcome#activated', as: 'activated'
  get '/activate', to: 'welcome#mail_info', as: 'mail_info'
  get '/documents/g0', to: 'documents#generate', as: 'generate'
end
