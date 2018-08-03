class Brand < ApplicationRecord
  validates 	:name, 		presence: true, uniqueness: true
  validates 	:website, presence: true

end
