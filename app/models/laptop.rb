class Laptop < ApplicationRecord
  paginates_per 5

  has_many    :laptop_categories
  has_many    :categories, through: :laptop_categories, dependent: :destroy

  has_many    :laptop_shops
  has_many    :shops, through: :laptop_shops, dependent: :destroy

  belongs_to  :brand

  has_many_attached :images

  accepts_nested_attributes_for :laptop_categories, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :laptop_shops,      allow_destroy: true, reject_if: :all_blank
  
  validates   :model_number, :name, :ram, :hdd, :processor, :weight, :screen, :usb_port, :graphics_card, :hdmi_port,  presence: true
  validates   :serial_number, presence: true, uniqueness: true

  def self.search(laptop_id, brand_id, search_processor, search_screen, search_graphics_card)
    if laptop_id or brand_id or search_processor or search_screen or search_graphics_card
      where('id LIKE ? and brand_id LIKE ? and processor LIKE ? and screen LIKE ? and graphics_card LIKE ?', "%#{laptop_id}%", "%#{brand_id}%", "%#{search_processor}%", "%#{search_screen}%", "%#{search_graphics_card}%").order(:name)
    else
      order(:name)
    end
  end
end
