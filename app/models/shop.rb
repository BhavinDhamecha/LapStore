class Shop < ApplicationRecord
	paginates_per 2
  validates   :name, :address, presence: true

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  has_many    :laptop_shops
  has_many    :laptops, through: :laptop_shops, dependent: :destroy

end