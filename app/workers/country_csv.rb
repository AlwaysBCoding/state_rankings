require 'csv'

class CountryCSV
	@queue = :countries_queue

	def self.perform(state_ids)
		states = State.where("id IN (?)", state_ids)
		csv_data = CSV.generate do |csv|
			csv << ["State", "Largest City", "Population"]
			states.each { |state| csv << [state.name, state.cities.largest.first.try(:name), state.cities.largest.first.try(:population)] }
		end

		CountryMailer.cities_csv(csv_data).deliver
	end

end
