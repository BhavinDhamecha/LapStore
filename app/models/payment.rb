class Payment < ApplicationRecord
	paginates_per 2
  belongs_to 	:order
  
  validates 	:mode, presence: true
  validates 	:status, presence: true
  validates 	:amount, presence: true

  def self.search(search_payment_mode)
 		if search_payment_mode
 			where('mode LIKE ?', "%#{search_payment_mode}%").order(:mode)
 		else
 			order(:mode)
 		end
 	end
end
