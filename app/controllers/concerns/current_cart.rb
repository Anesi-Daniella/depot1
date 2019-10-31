module CurrentCart
    private
  
    def set_cart
      has_many :line_items, dependent: :destroy
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  