class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    search_term = params[:search]
    discounted = params[:discount]
    sorted_attribute = params[:sort]
    sort_order = params[:sort_order]

    if search_term
      @products = @products.where("name iLIKE ?","%#{search_term}%")
    end

    if discounted == "true"
      @products = @products.where("price < ?", 20)

    end

    if sorted_attribute
      
      if sort_order == "high" or sort_order == "desc"
        desc = "desc"
        @products = @products.all.order(sorted_attribute => desc)
      elsif sorted_attribute or (sort_order == "low" or sort_order == "asc")
        @products = @products.all.order(sorted_attribute)
      end
    else
      @products = @products.all.order(:id)
    end

    render 'index.json.jbuilder'
  end


  def create
    @product = Product.new(
                          name: params[:name],
                          price: params[:price],
                          description: params[:description],
                          material: params[:material],
                          in_stock: params[:in_stock],
                          style: params[:style],
                          supplier_id: params[:supplier_id]
                          )
    if @product.save

      render 'show.json.jbuilder'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.material = params[:material] || @product.material
    @product.in_stock = params[:in_stock] || @product.in_stock
    @product.style = params[:style] || @product.style
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    

    if @product.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Successfully destroyed products"}
  end
end
