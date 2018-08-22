class Order < ApplicationRecord
	paginates_per 2
	
  belongs_to 	:laptop
  belongs_to 	:customer
  
  validates 	:shipping_address, :billing_address, :status, :amount, 	presence: true

  def self.search(laptop_id)
 		if laptop_id
 			where('laptop_id LIKE ?', "%#{laptop_id}%").order(:date)
 		else
 			order(:date)
 		end
 	end

end
