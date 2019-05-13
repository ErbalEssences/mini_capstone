class Supplier < ApplicationRecord

  # validates :name, presence: true
  # validates :name, uniqueness: true

  # validates :email, presence: true
  # validates :email, uniqueness: true
  # validates :email, format: {with: /\A\w+[@]\w{3,}[.]\w{2,}\z/, message: "must be a valid email format"}

  def products
    Product.where(product_id: id)
  end
end
