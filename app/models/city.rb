class City < ActiveRecord::Base
  attr_accessible :name, :ranking, :state_id
  belongs_to :state

  validates_uniqueness_of :ranking

  default_scope order("ranking asc")
end
