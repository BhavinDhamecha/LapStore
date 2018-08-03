class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string 		:mode, limit: 5
      t.string 		:status, limit: 5
      t.integer 	:amount
      
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
