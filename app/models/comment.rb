class Comment < ApplicationRecord
	belongs_to :post, dependent: :destroy ,counter_cache: true
	belongs_to :user, dependent: :destroy
	has_many :usercommentrating
  	has_many :users,through: :usercommentratings
end
