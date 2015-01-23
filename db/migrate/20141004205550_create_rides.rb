class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :driver
      t.text :source
      t.text :destination
      t.text :description
      t.integer :spots_available
      t.integer :spots_taken, :default => 0 
      t.float :price
      t.timestamps
    end
  end
end
