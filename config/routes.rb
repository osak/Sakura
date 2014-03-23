Cherry::Application.routes.draw do
  resources :contents, except: [:create] do
    collection do
      post 'upload', action: :upload
    end
  end
  match '/auth/:provider/callback' => 'sessions#callback', via: [:get, :post]
  match '/logout' => 'sessions#destroy', as: :logout, via: [:get]

  root 'home#index'
end
