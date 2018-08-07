class Brand < ApplicationRecord
	paginates_per 2

  validates 	:name, 		presence: true, uniqueness: true
  validates 	:website, presence: true

  def self.search(search_brand_name)
 		if search_brand_name
 			where('name LIKE ?', "%#{search_brand_name}%").order(:name)
 		else
 			order(:name)
 		end
 	end
end
