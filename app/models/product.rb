class Product < ApplicationRecord
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true 
	validates :image_url, uniqueness: true #format: {
		#with: %r{\.(gif|jpg|pmg)$}i,
		#message: 'must be a URL for GIF, JPG or PNG image.'
		#'URL должен указывать на изображение формата GIF, JPG или PNG.'
	#} 
end
