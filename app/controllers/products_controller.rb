class ProductsController < ApplicationController
  def index
    # Load products along with their associated categories to avoid N+1 problem
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
