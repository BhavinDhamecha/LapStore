class Category < ApplicationRecord
	has_many		:laptop_categories
	has_many		:laptops, through: :laptop_categories, dependent: :destroy
  
  accepts_nested_attributes_for :laptop_categories, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :laptops, allow_destroy: true
  
	validates 	:name, presence: true, uniqueness: true
end
