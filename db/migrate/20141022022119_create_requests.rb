class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :ride_id
      t.string :passenger
      t.string :ignore, null: false, default: false
      t.string :accept, null: false, default: false
      t.timestamps
    end
  end
end
