Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:show, :new, :create]
  end

  resources :bookmarks, only: [:destroy]

end
