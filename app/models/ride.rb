class Ride < ActiveRecord::Base
	belongs_to :user
	has_many :requests
	has_many :bookings
end
