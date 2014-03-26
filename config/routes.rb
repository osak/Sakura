Cherry::Application.routes.draw do
  resources :users

  resources :contents, except: [:create] do
    collection do
      post 'upload', action: :upload
    end
  end
  get '/auth/:provider', to: 'sessions#dummy', as: :login
  match '/auth/:provider/callback' => 'sessions#callback', via: [:get, :post]
  match '/logout' => 'sessions#destroy', as: :logout, via: [:get]

  root 'home#index'
end
