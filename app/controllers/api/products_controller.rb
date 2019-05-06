class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          description: params[:description],
                          material: params[:material],
                          type: params[:type],
                          image_url: params[:image_url],
                          style: params[:style]
                          )
    @product.save
    render 'show.json.jbuilder'
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def patch
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.material = params[:material] || @product.material
    @product.type = params[:type] || @product.type
    @product.style = params[:style] || @product.style
    @product.save
    render 'show.json.jbuilder'
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Successfully destroyed recipe"}
  end
end
