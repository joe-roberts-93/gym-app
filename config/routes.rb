Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, :workouts, :exercises, only:[:index, :show, :create]
  resources :gyms, :movements, only:[:index, :show]

  resources :users, only:[:index, :show, :create] do
    resources :goals, only:[:index, :show, :create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
