class Order < ApplicationRecord
	paginates_per 2
	
  belongs_to 	:laptop
  belongs_to 	:customer
  
  validates 	:shipping_address, presence: true
  validates 	:billing_address, presence: true
  validates 	:status, presence: true
  validates 	:amount, presence: true
end
