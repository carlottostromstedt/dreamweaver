Rails.application.routes.draw do
  resources :dreams
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dreams#index"

  get '/storytime', to: 'stories#index'
  get '/storytime/show', to: 'stories#show'

end
