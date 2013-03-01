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
