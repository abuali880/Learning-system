class Slide < ActiveRecord::Base
	belongs_to :lecture
	has_many :comments
	has_one :likes
  acts_as_votable
end
