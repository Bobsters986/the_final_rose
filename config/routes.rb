Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bachelorettes, only: [:show] do
    resources :contestants, only: [:index]
  end

  resources :contestants, only: [:show]
  resources :outings, only: [:show]

  delete '/contestants/:contestant_id/outings/:id', to: 'contestant_outings#destroy'
end
