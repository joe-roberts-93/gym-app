Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :workouts, :exercises, only:[:index, :show, :create]
  resources :gyms, :movements, only:[:index, :show]

  resources :users, only:[:index, :show, :create] do
    resources :goals, only:[:index, :show, :create]
    collection do
      get '/find_by_email', to: 'users#find_by_email'
    end
  end

  # resource :users do
  #   collection do
  #     get '/find_by_email', to: 'users#find_by_email'
  #   end
  # end

  # Defines the root path route ("/")
  # root "articles#index"
end
