class Laptop < ApplicationRecord
	paginates_per 5

	has_many		:laptop_categories
	has_many		:categories, through: :laptop_categories, dependent: :destroy
  belongs_to 	:brand

  has_many_attached	:images

  accepts_nested_attributes_for :laptop_categories, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :categories, 				allow_destroy: true
  
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


 	def self.search(search_laptop)
 		if search_laptop
 			where('name or processor LIKE ?', "%#{search_laptop}%")
 		else
 			all
 		end
 	end

end
