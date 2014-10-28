class AddPassengersIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :passenger_id, :integer
  end
end
