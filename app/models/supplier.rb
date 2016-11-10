class Supplier < ApplicationRecord
  has_many :tags_suppliers
  has_many :tags, :through => :tags_suppliers

  #Virtual attributes -- First time using
  def all_tags=(tags)
    self.tags = tags.split(",").map do |name|
      Tag.where(tag: tag.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&tag).join(", ")
  end

end
