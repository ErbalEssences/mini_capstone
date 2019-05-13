class Api::SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
    search_term = params[:search]
    discounted = params[:discount]
    sorted_attribute = params[:sort]
    sort_order = params[:sort_order]

    if search_term
      @suppliers = @supplies.where("name iLIKE ?","%#{search_term}%")
    end

    @suppliers = @supplies.order(:id)

    renders 'index.json.jbuilder'
  end


  def create
    @supplier = Supplier.new(
                          name: params[:name],
                          email: params[:email],
                          phone_number: params[:phone_number]
                          )
    if @supplier.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
    render 'show.json.jbuilder'
  end

  def patch
    @supplier = Supplier.find(params[:id])
    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number

    if @supplier.save
      render 'show.json.jbuilder'
    else 
      render json: {message: @supplier.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    render json: {message: "Successfully destroyed recipe"}
  end
end
