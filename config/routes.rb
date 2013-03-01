StateRankings::Application.routes.draw do

  get "countries" => "countries#index", as: "countries_url"
  get "countries/:id" => "countries#show", as: "country_url"

  root to: "pages#index"
  get "pages/index"

end
