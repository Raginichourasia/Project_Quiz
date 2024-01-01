class Product < ApplicationRecord
    has_many :pictures, as: :imagable

    # scope :find_product_with_man, -> (man) {where("manufacturer = man") if manufacturer.present?}
    # scope :find_product_with_man, ->  {where.not(manufacturer: nil)}
    # scope :draft, -> { create_with(name: "R") }
end
