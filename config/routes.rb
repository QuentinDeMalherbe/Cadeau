Rails.application.routes.draw do
  root to: 'familles#index'
  resources :familles  do
    resources :users do
      resources :idees, only: :create
    end
  end

  post 'tirage' ,to:'familles#tirage', as: :tirage
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
