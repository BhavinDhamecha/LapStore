class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string    :name
      t.string    :address, limit: 1000
      t.string    :number, limit: 13
      t.string    :username, limit: 10
      t.string    :email

      t.timestamps
    end
  end
end
