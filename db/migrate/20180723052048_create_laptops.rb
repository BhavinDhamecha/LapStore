class CreateLaptops < ActiveRecord::Migration[5.2]
  def change
    create_table :laptops do |t|
      t.string    :model_number, limit: 10
      t.string    :name, limit: 50
      t.string    :serial_number, limit: 20
      t.string    :ram, limit: 7
      t.string    :hdd, limit: 7
      t.string    :processor, limit: 50
      t.string    :weight, limit: 10
      t.string    :screen, limit: 10
      t.string    :graphics_card, limit: 20
      t.integer   :usb_port, limit: 5
      t.integer   :hdmi_port, limit: 5
      t.boolean   :available

      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
