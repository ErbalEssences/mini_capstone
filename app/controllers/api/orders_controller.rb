class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index    
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create

    calculate_subtotal = current_user.cart.sum {|carted_product| carted_product.subtotal}

    # calculate_subtotal = 0
    # current_user.cart.each do |item|
    #   calculate_subtotal += item.product.price * item.quantity
    # end

    calculated_tax = calculate_subtotal * 0.09
    calculate_total = calculate_subtotal + calculated_tax
    @order = Order.new(
                        user_id: current_user.id,
                        subtotal: calculate_subtotal,
                        tax: calculated_tax,
                        total: calculate_total
                        )
    if @order.save
      current_user.cart.update_all(status: "purchased", order_id: @order.id)
      
      render 'show.json.jbuilder'
    end
  end

  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

end
