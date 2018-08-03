class LaptopCategory < ApplicationRecord
  belongs_to :laptop, optional: true
  belongs_to :category, optional: true

  validates_uniqueness_of	:laptop_id, scope: [:category_id]
end
