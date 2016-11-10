class TagsSupplier < ApplicationRecord
  belongs_to :supplier
  belongs_to :tag
end
