Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/login', to: 'authentication#login'

  resources :workouts, :exercises, only:[:index, :show, :create]
  resources :gyms, :movements, only:[:index, :show]

  resources :users, only:[:index, :show, :create] do
    collection do
      get 'top_lifters_last_week'
    end
    resources :goals, only:[:index, :show, :create]
    collection do
      get '/find_by_email', to: 'users#find_by_email'
    end
  end
  post '/signup', to: 'registrations#create'
  get '/top_lifters', to: 'users#top_lifters', as: 'top_lifters'
  post '/logout', to: 'sessions#destroy'
  # resource :users do
  #   collection do
  #     get '/find_by_email', to: 'users#find_by_email'
  #   end
  # end

  # Defines the root path route ("/")
  # root "articles#index"
end
