class StatesController < ApplicationController

	def update_state_rankings
		params["rankings"].each_with_index { |id, index| State.find(id).update_column(:ranking, index+1) }
		render json: State.all
	end

end
