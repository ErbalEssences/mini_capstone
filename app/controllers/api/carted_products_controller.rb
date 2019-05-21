class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.cart
    render 'index.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(
                                           user_id: current_user.id, 
                                           product_id: params[:product_id], 
                                           quantity: params[:quantity],
                                           status: "carted"
                                          )

    if @carted_product.save
      render 'show.json.jbuilder'
    end
  end

  def destroy
    @carted_product = current_user.carted_products.find(params[:id])
    @carted_product.update(status: "removed")
    render json: {message: "Successfully destroyed carted product"}
  end

end
