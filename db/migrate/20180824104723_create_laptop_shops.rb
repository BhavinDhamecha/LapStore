class CreateLaptopShops < ActiveRecord::Migration[5.2]
  def change
    create_table :laptop_shops do |t|
      t.references :laptop, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
