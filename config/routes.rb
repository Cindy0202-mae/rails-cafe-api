Rails.application.routes.draw do
  root to: 'pages#home'
  # as a user I can see a list of all my cafes
  # as a user I can add a new cafe
  # 'api/v1/cafes'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cafes, only: [:index, :create]
      resources :criteria, only: [:index]
    end
  end
  # as a user I search for a cafe
end
