class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string 		:name, limit: 10
      t.string 		:website

      t.timestamps
    end
  end
end
