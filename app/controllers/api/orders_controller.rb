class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index    
      @orders = current_user.orders
      render 'index.json.jbuilder'
  end

  def create
    subtotal = 0
    cart = current_user.carted_products.where(status: "carted")

    cart.each do |item|
      subtotal += item.product.price * item.quantity
    end

    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.new(
                        user_id: current_user.id,
                        subtotal: subtotal,
                        tax: tax,
                        total: total
                        )
    if @order.save
      cart.each do |item|
        item.update(status: "purchased")
      end
      
      render 'show.json.jbuilder'
    end
  end

end
