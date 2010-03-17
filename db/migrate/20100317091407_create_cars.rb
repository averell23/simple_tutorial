class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.references :user
      t.string :model_name
      t.string :color
      t.date :made_in
      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
