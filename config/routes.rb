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
  get '/documents/generate', to: 'documents#generate', as: 'generate'
  get '/formula/generate', to: 'documents#formula_generate', as: 'formula_generate'
  get '/documents/categories(/:id)', to: 'documents#category_pick', as: 'category_pick'
  get '/documents/create(/:action_type)', to: 'documents#document_create', as: 'document_create'
  get '/formula/create(/:action_type)', to: 'documents#formula_create', as: 'formula_create'
  get '/formula/add/person(/:action_type)', to: 'documents#add_person', as: 'formula_add_person'
  get '/formula/remove/person/:id', to: 'documents#remove_person', as: 'remove_person'
  get '/inicio', to: 'about#about_word', as: 'about_word'
  get '/proximos', to: 'about#about_pdf', as: 'about_pdf'
end
