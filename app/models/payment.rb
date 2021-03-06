class Payment < ApplicationRecord
	paginates_per 2
  belongs_to 	:order
  
  validates 	:mode, :status, :amount, presence: true

  def self.search(order_id)
 		if order_id
 			where('order_id LIKE ?', "%#{order_id}%").order(:mode)
 		else
 			order(:mode)
 		end
 	end
end
