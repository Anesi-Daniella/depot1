require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    # creates a new product with empty components. Validation requires that all components are filled- hence this product should currently be invalid
  # test "product attributes must not be empty" do
  #   product = Product.new
  #   assert product.invalid?
  #   assert product.errors[:title].any?
  #   assert product.errors[:description].any?
  #   assert product.errors[:price].any?
  #   assert product.errors[:image_url].any?
  # end  
# Ensures no product with negative or no price is stored on the db
test "image url must point to an image file" do
  product = products(:one)
  ok = %w{ frog.gif frog.jpg frog.png FROG.PNG fRoG.PnG
           http://a.b.c/x/y/z/frog.png frog.jpeg }
  bad = %w{ frog.doc frog.png/less frog.png.less }

  ok.each do |url|
    product.image_url = url
    assert product.valid?, "#{url} should be a valid image url"
  end

  bad.each do |url|
    product.image_url = url
    assert product.invalid?, "#{url} shouldn't be a valid image url"
  end
  # Test to ensure no two products have the same title
  test "product is not valid without a unique title" do
    product = Product.new(:title       => products(:ruby).title,
                          :description => "xxx",
                          :price       => 1,
                          :image_url   => "barney.gif")
  
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
