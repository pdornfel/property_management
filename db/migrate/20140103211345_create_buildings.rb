class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :description

      t.timestamps
    end
  end
end
