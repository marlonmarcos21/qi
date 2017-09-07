class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :user, index: true
      t.string :name
      t.integer :latitude
      t.integer :longitude
      t.boolean :private

      t.timestamps null: false
    end
  end
end
