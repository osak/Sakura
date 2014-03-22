Cherry::Application.routes.draw do
  resources :contents, except: [:create] do
    collection do
      post 'upload', action: :upload
    end
  end

  root 'home#index'
end
