Rails.application.routes.draw do
  get 'addresses/show'
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show] , path: '/relationships/kind', as: :relationship_kind
    resource :phones, only: [:show]
    resource :phone, only: [:update, :create, :destroy]
    resource :phones, only: [:show] , path: '/relationships/phones', as: :relationship_phones
    resource :phone, only: [:update, :create, :destroy] , path: '/relationships/phones', as: :relationship_phones
    resource :address, only: [:show, :update, :create, :destroy] 
    resource :address, only: [:show, :update, :create, :destroy] , path: '/relationships/address', as: :relationship_address
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
