class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    
      @orders = current_user.orders
      render 'index.json.jbuilder'

  end

  def create
    @order = Order.new(
                        user_id: current_user.id,
                        product_id: params[:product_id],
                        quantity: params[:quantity]
                        )
    if @order.save
      render 'show.json.jbuilder'
    end
  end

end
