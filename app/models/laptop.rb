class Laptop < ApplicationRecord
	paginates_per 5

	has_many		:laptop_categories
	has_many		:categories, through: :laptop_categories, dependent: :destroy
  belongs_to 	:brand

  has_many_attached	:images

  accepts_nested_attributes_for :laptop_categories, allow_destroy: true, reject_if: :all_blank
  
  validates 	:model_number, 	presence: true
 	validates 	:name, 					presence: true
 	validates 	:serial_number, presence: true, uniqueness: true
 	validates 	:ram, 					presence: true
 	validates 	:hdd, 					presence: true
 	validates 	:processor,			presence: true
 	validates 	:weight, 				presence: true
 	validates 	:screen, 				presence: true
 	validates 	:usb_port, 			presence: true
 	validates 	:graphics_card, presence: true
 	validates 	:hdmi_port, 		presence: true


 	def self.search(search_laptop_name, search_processor, brand_id)
 		if search_laptop_name or search_processor or brand_id
 			where('name LIKE ? and processor LIKE ? and brand_id LIKE ?', "%#{search_laptop_name}%", "%#{search_processor}%", "%#{brand_id}%").order(:name)
 		else
 			order(:name)
 		end
 	end

end
