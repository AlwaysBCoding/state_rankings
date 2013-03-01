class State < ActiveRecord::Base
  attr_accessible :country_id, :name, :ranking
  belongs_to :country
  has_many :cities

  validates_uniqueness_of :ranking

  default_scope order("ranking asc")
end
