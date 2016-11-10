class Supplier < ApplicationRecord
  has_many :tags_suppliers
  has_many :tags, :through => :tags_suppliers

  #Virtual attributes -- First time using
  #When attribute :all_tags is called, call these functions on the values before adding it to the database?
  #Must be like that...
  def all_tags=(tags)
    self.tags = tags.split(",").map do |tag|
      Tag.where(tag: tag.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:tag).join(", ")
  end

end
