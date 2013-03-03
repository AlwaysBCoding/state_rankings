class City < ActiveRecord::Base
  attr_accessible :name, :ranking, :state_id, :population
  belongs_to :state

  validates_uniqueness_of :ranking, scope: [:state_id]

  default_scope order("ranking asc")
  scope :largest, order("ranking asc")
end
