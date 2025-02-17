Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/patient_records/{id}/headers', to: 'patient_records#headers'
  get '/patient_records/{id}/image', to: 'patient_records#image'
  post '/patient_records', to: 'patient_records#create'
end
