Country.destroy_all
puts "Destroying Countries..."
usa = Country.create! name: "United States"
puts "Created Country - United States"

State.destroy_all
puts "Destroying States..."
states = YAML::load_file("#{Rails.root}/db/default/states.yml")
states.each_with_index do |state, index|
	usa.states.create! name: "#{state[1]['name']}", abbreviation: "#{state[1]['abbreviation']}", ranking: index+1
	puts "Created State -  #{state[1]['name']}"
end

ny = State.find_by_name("New York")

City.destroy_all
puts "Destroying Cities..."
ny.cities.create! name: "New York", population: 12000000, ranking: 1
ny.cities.create! name: "Glen Cove", population: 50000, ranking: 2
puts "Creating Cities for New York..."
