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
end

