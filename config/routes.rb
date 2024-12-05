Rails.application.routes.draw do
  resources :challenges, only: [:index, :create]
  resources :tables, only: [:index]
  
  resources :bookings do
    collection do
      post 'mpesa_callback'
    end
  end
  resources :tournaments, only: [:index, :create, :show] do
    member do
      post :register
      get :countdown
      post :assign_winners
    end
  end

resources :challenges, only: [:index, :create, :show] do
  member do
    post :accept
  end
end
resources :bookings, only: [:create, :show, :index] # Adjust actions as needed
  
  # Route for payment verification
  post 'payments/verify', to: 'payments#verify'


resources :tables do
  member do
    get :show_table_availability
  end
end


resources :match_seat_bookings, only: [:index, :create, :destroy]
 # Fixture routes for each league
 get '/fixtures/premier_league', to: 'fixtures#premier_league'
 get '/fixtures/champions_league', to: 'fixtures#champions_league'
 get '/fixtures/la_liga', to: 'fixtures#la_liga'
 
 # Default route for fetching all leagues' fixtures
 get '/fixtures', to: 'fixtures#index'


  
  resources :bookings, only: [:create]
end
