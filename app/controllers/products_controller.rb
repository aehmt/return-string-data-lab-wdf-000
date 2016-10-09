class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      return redirect_to products_path
    end
    redirect_to new_product_path
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def inventory
    product = Product.find_by(id: params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def price 
    product = Product.find_by(id: params[:id])
    render plain: product.price.to_s
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
