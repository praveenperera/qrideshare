class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :ride_id
      t.string :passenger
      t.boolean :ignore

      t.timestamps
    end
  end
end
