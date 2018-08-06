class Brand < ApplicationRecord
	paginates_per 2

  validates 	:name, 		presence: true, uniqueness: true
  validates 	:website, presence: true

end
