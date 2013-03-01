class State < ActiveRecord::Base
  attr_accessible :country_id, :name, :ranking, :abbreviation
  belongs_to :country
  has_many :cities

  validates_uniqueness_of :ranking
  validates_uniqueness_of :name
  validates_uniqueness_of :abbreviation

  default_scope order("ranking asc")
end
