class Payment < ApplicationRecord
  belongs_to 	:order
  
  validates 	:mode, presence: true
  validates 	:status, presence: true
  validates 	:amount, presence: true
end
