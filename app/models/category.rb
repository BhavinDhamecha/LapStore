class Category < ApplicationRecord
	paginates_per 2

	has_many		:laptop_categories
	has_many		:laptops, through: :laptop_categories, dependent: :destroy
    
	validates 	:name, presence: true, uniqueness: true

	def self.search(search_category_name)
 		if search_category_name
 			where('name LIKE ?', "%#{search_category_name}%").order(:name)
 		else
 			order(:name)
 		end
 	end
end
