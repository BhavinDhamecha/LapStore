class Order < ApplicationRecord
	paginates_per 2
	
  belongs_to 	:laptop
  belongs_to 	:customer
  
  validates 	:shipping_address, presence: true
  validates 	:billing_address, presence: true
  validates 	:status, presence: true
  validates 	:amount, presence: true

  def self.search(search_order_date)
 		if search_order_date
 			where('date LIKE ?', "%#{search_order_date}%").order(:date)
 		else
 			order(:date)
 		end
 	end

end
