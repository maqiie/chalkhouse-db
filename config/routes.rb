Rails.application.routes.draw do
  resources :challenges, only: [:index, :create]
  resources :tables, only: [:index]
  
  resources :bookings do
    collection do
      post 'mpesa_callback'
    end
  end
  
  
  resources :bookings, only: [:create]
end
