class CreateLaptopCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :laptop_categories do |t|
      t.references :laptop, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
