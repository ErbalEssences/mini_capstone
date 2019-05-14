class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0, less_then: 10000000 }
  validates :description, presence: true


  belongs_to :supplier
  # long hand
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images
  # long hand
  # def images
  #   Image.where(product_id: id)
  # end

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
