class StoreController < ApplicationController
  # the line below gives me an error for some unknown reason 
  # skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.order(:title)
  end
end

