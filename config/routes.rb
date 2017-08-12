Rails.application.routes.draw do
  resources :adverts
  devise_for :users

  root 'adverts#index'

  get 'home/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
