class LineItem < ApplicationRecord
  # with the following any line item has 2 attributes .product and .cart which can be used to access the cart of a line item as li.cart
  belongs_to :product
  belongs_to :cart
end
