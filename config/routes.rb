Sakura::Application.routes.draw do
  resources :users

  resources :contents, except: [:create] do
    collection do
      post 'upload', action: :upload
    end
  end
  get '/auth/:provider', to: 'sessions#dummy', as: :login
  get '/auth/:provider/callback', to: 'sessions#callback'
  get '/logout', to: 'sessions#destroy', as: :logout

  root 'home#index'
end
