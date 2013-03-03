class CountryMailer < ActionMailer::Base
  default from: "DrewChambersDC@gmail.com"

  def cities_csv(csv_data)
  	attachments["cities-csv.csv"] = csv_data
  	mail(to: "Jordan Leigh <JDLeigh10@gmail.com>", subject: "CSV of Cities")
  end

end
