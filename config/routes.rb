Rails.application.routes.draw do
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
  
  root 'cocktails#index'
  
  resources :ingredients, only: [:index, :show]

  resources :doses, only: :destroy
  
  resources :cocktails, only: [:index, :show, :new, :create, :update] do

    resources :doses, only: [:new, :create]

  end

  mount Attachinary::Engine => "/attachinary"
end
