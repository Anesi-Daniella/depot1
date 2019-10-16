class StoreController < ApplicationController
  def index
    #Here Product is our old product model and order is a method that applies to the Product class and creates a list of all productsin the database
    @products = Product.order(:title)
  end
end
