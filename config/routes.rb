Rails.application.routes.draw do
  root to: "site#index"
  get "/admin" => "site#admin"

  post "/admin/create_set" => "site#create_player_set"
  post "/admin/create_stats" => "site#download_nfl_stats"


  namespace :api do
    namespace :v1 do
      resources :players, only: [:index, :create, :destroy, :update]
      get "filter" => "players#filter"
    end
  end
end
