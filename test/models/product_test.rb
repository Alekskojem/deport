   require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   test "product attributes must not be empty" do
   product = Product.new
   test "product price must be positive" do
   	#The price of product must be positive
   product = Product.new(title: "My Book Title",
   						description: "yyy",
   						image_url: "zzz.jpg")
   product.price = -1
   assert product.invalid?
   assert product.errors[:title].any?
   assert product.errors[:description].any?
   assert product.errors[:price].any?
   assert product.errors[:image_url].any?
   assert_equal ["must be greater than or equal to 0.01"],

   product.errors[:price]
   # must be more or equal 0.01
   product.price = 0

   assert product.invalid?
   assert_equal ["must be greater than or equal to 0.01"],
   	product.errors[:price]
   product.price = 1
   assert product.valid?

test "product price must be positive" do
	# цена товара должна быть положительной
	product = Product.new(title: "My Book Title",
							description: "yyy",
							image_url: "zzz.jpg")
	product.price = -1
	assert product.invalid?
	assert_equal ["must be greater than or equal to 0.01"],
	
	product.errors[:price]
	# должна быть больше или равна 0.01
	product.price = 0

	assert product.invalid?
	assert_equal ["must be greater than or equal to 0.01"],
		product.errors[:price]
	product.price = 1
	assert product.valid?
end

   def new_product(image_url)
   	Product.new(	title: "My Book Title",
   				description: "yyy",
   				price: 1,
   				image_url: image_url)
   end

   test "image url" do
   		#url image
   		ok = %w{ fred.gif fred.jpg, fred.png FRED.JPG FRED.Jpg
   				http://a.b.c/x/y/z/fred.gif }
   		bad = %w{	fred.doc, fred.gif/more fred.gif.more	}
		end

   		ok.each do |name|
   			assert new_product(name).valid?, "#{name} sholdn't be invalid"
   									# dont must be valid
   		end

   		bad.each do |name|
   			assert new_product(name).invalid?, "#{name} chould't be valid"
   										# dont be a valid 
   		end
