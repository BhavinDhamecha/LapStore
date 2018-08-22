class Laptop < ApplicationRecord
	paginates_per 5

	has_many		:laptop_categories
	has_many		:categories, through: :laptop_categories, dependent: :destroy
  belongs_to 	:brand

  has_many_attached	:images

  accepts_nested_attributes_for :laptop_categories, allow_destroy: true, reject_if: :all_blank
  
  validates 	:model_number, :name, :ram, :hdd, :processor, :weight, :screen, :usb_port, :graphics_card, :hdmi_port, 	presence: true
 	validates 	:serial_number, presence: true, uniqueness: true


 	def self.search(search_laptop_name, search_processor, brand_id)
 		if search_laptop_name or search_processor or brand_id
 			where('name LIKE ? and processor LIKE ? and brand_id LIKE ?', "%#{search_laptop_name}%", "%#{search_processor}%", "%#{brand_id}%").order(:name)
 		else
 			order(:name)
 		end
 	end

end
