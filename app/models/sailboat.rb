class Sailboat < ActiveRecord::Base
  has_many :tasks

#  scope :colgate, -> { where(boat_type: "Colgate") }
#  scope :rhodes, 
#  scope :ideal 
end
