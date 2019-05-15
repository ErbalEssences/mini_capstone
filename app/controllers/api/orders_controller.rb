class Api::OrdersController < ApplicationController

  def index
    if current_user
      @orders = current_user.orders
      render 'index.json.jbuilder'
    else
      render json: []
    end
  end


  def create

    @order = Order.new(
                        user_id: current_user.id,
                        product_id: params[:product_id],
                        quantity: params[:quantity]
                        )
    if @order.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
