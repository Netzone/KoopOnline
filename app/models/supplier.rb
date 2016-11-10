class Supplier < ApplicationRecord
  has_many :tags_suppliers
  has_many :tags, :through => :tags_suppliers
end
