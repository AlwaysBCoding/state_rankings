class CountriesController < ApplicationController

  def index
  	@countries = Country.all
  end

  def show
  	@country = Country.includes(:states).find(params[:id])
  	@states = @country.states
  end

end
