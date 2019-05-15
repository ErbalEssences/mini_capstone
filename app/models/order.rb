class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user


  def subtotal
    subtotal = product.price * quantity
  end

  def tax
    tax = subtotal * 0.09
  end

  def total
    total = subtotal + tax
  end

end
