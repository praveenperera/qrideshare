class Ride < ActiveRecord::Base
	belongs_to :user
	has_many :requests
	has_many :bookings

	validates :source, :destination, presence: true, length: { minimum: 3 }
	validates :price, :spots_available, :leaving_date, :leaving_time, presence: true
	validates :spots_available, :price, numericality: {greater_than: 0}


end
