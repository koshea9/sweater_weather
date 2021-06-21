Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'backgrounds#show'
      get '/forecast', to: 'forecasts#show'
      post '/road_trip', to: 'road_trip#create'
      post '/sessions', to: 'sessions#create'
      post '/users', to: 'users#create'
    end
  end
end
