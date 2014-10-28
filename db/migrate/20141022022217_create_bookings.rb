class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :ride_id
      t.string :passenger

      t.timestamps
    end
  end
end
