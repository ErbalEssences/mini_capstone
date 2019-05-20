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
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :orders, through: :carted_products
  #  def categories
  #   product_categories.map {|product_category| product_category.category}
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
