Rails.application.routes.draw do
  resources :owners
  resources :pets
  resources :vets
  resources :appointments do
    resources :treatments, only: [:new, :create, :edit, :update, :destroy]
  end

  root "pets#index"
end