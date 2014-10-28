class AddColumnsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :leaving_date, :date
    add_column :rides, :leaving_time, :time
  end
end
