Rails.application.routes.draw do
  root to: "site#index"

  namespace :api do
    namespace :v1 do
      resources :players, only: [:index, :create, :destroy, :update]
      get "filter" => "players#filter"
    end
  end
end
