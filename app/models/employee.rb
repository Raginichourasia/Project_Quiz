class Employee < ApplicationRecord
    has_many :pictures, as: :imagable
end
