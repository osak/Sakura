Sakura::Application.routes.draw do
  resources :users

  resources :contents, except: [:create] do
    collection do
      post 'upload', action: :upload
    end
  end
  post '/login', to: 'sessions#create', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout

  root 'home#index'
end
