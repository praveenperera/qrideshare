class AddPassengersIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :passenger_id, :integer
  end
end
