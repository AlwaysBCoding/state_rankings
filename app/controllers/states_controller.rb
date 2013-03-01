class StatesController < ApplicationController

	def update_state_rankings
		params["rankings"].each_with_index { |id, index| State.find(id).update_attributes(ranking: index+1) }
		render nothing: true
	end

end
