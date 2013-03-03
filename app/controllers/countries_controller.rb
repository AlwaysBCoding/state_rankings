class CountriesController < ApplicationController

	def index
		@countries = Country.all
	end

	def show
		@country = Country.includes(:states, :states => :cities).find(params[:id])
		@states = @country.states

		# Resque.enqueue(CountryCSV, @states.pluck(:id))
	end

end
