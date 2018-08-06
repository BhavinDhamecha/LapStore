class Payment < ApplicationRecord
	paginates_per 2
  belongs_to 	:order
  
  validates 	:mode, presence: true
  validates 	:status, presence: true
  validates 	:amount, presence: true
end
