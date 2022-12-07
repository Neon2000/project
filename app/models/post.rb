class Post < ApplicationRecord
	validates :name, length: { minimum: 8 }
	paginates_per 5
	belongs_to :topic
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :post_tags, dependent: :destroy
	has_many :tags, through: :post_tags
	has_many :reviews, dependent: :destroy
	has_one_attached :image
	has_many :posts_users_read_statuses
	has_many :users,through: :posts_users_read_statuses

	scope :date_filter ,lambda{|date_from,date_to| where('posted_at BETWEEN ? AND ?', date_from, date_to)}
	

end
