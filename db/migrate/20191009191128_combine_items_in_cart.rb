class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def change
  end
  def up
  	#change some write for for the same item in cart one write
  	Cart.all.each do |cart|
  		# count items in cart
  		sums = cart.line_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id, quantity|
  			if quantity > 1
  				# delete some of writers
  				cart.line_items.where(product_id: product_id).delete_all

  				#changes alone writes
  				cart.line_items.create(product_id: product_id, quantity: quantity)
  			end
  		end
  	end
  end
  def down
  	#drop writings quantity>1 on ather some writings
  	LineItem.where("quantity>1").each do |line_item|
  		#add invalid items
  		line_item.quantity.times do
  			LineItem.create cart_id: line_item.cart_id,
  			product_id: line_item.product_id, quantity: 1
  		end
  		#delete first writen
  		line_item.destroy
  end
end

