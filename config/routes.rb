Rails.application.routes.draw do
  # as a user I can see a list of all my cafes
  # as a user I can add a new cafe
  # 'api/v1/cafes'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cafes, only: [:index, :create]
    end
  end
  # as a user I search for a cafe
end
