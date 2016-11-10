class Tag < ApplicationRecord
  has_many :tags_suppliers
  has_many :suppliers, :through => :tags_suppliers
  validates :tag, presence: true
end
