Rails.application.routes.draw do
  devise_for :users
  # get 'ingredients/index'

  # get 'ingredients/show'

  # get 'doses/new'

  # get 'doses/create'

  # get 'doses/destroy'

  # get 'cocktails/index'

  # get 'cocktails/show'

  # get 'cocktails/new'

  # get 'cocktails/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'cocktails#home'
  
  resources :ingredients, only: [:index, :show]

  resources :doses, only: :destroy
  
  get "favorites", to: "cocktails#favorites"

  resources :cocktails, only: [:index, :show, :new, :create, :update] do

    resources :doses, only: [:new, :create]

    member do
      get "like"
      get "unlike"
    end

  end

  mount Attachinary::Engine => "/attachinary"
end
