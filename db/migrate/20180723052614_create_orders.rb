class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date      :date
      t.string    :shipping_address, limit: 1000
      t.string    :billing_address, limit: 1000
      t.string    :status, limit: 5
      t.integer   :amount

      t.references :laptop, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
