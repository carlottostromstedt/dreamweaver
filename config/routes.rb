Rails.application.routes.draw do
  devise_for :users
  resources :dreams
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "stories#index"

  get '/storytime', to: 'stories#index'
  get '/storytime/show', to: 'stories#show'
  get '/storytime/redream', to: 'stories#redream'
end

