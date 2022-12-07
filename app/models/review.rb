class Review < ApplicationRecord
	belongs_to :post, dependent: :destroy,

	after_create :avg_post

	def avg_post
		post.update_attribute(:avg_rating, Review.average(:rating)|| 0.0.floor(1))
		#Review.average(:rating)|| 0.0.floor(1)
	end
end
