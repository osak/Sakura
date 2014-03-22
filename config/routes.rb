Cherry::Application.routes.draw do
  resources :contents

  root 'home#index'
end
