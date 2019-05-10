class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_then: 10000000 }

  validates :description, presence: true
  validates :description, length: { in: 10..200 }
  validates :image_url, length: { maximum: 255 }


  def is_discounted?
    price < 20
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end
end
