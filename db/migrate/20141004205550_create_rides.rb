class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :driver
      t.text :source
      t.text :destination
      t.integer :spots_available
      t.integer :spots_taken
      t.float :price
      t.timestamps
    end
  end
end
