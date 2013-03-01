StateRankings::Application.routes.draw do

  get "countries" => "countries#index", as: "countries_url"
  get "countries/:id" => "countries#show", as: "country_url"

  post "update_state_rankings" => "states#update_state_rankings", as: "update_state_rankings"

  root to: "pages#index"
  get "pages/index"

end
