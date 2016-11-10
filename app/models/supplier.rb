class Supplier < ApplicationRecord
  belongs_to :user
  has_many :tags_suppliers
  has_many :tags, :through => :tags_suppliers
  validates :website, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :name, presence: true

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
