class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_one :post
  has_one :comment 
  has_many :posts_users_read_status
  has_many :posts, through: :posts_users_read_status
  has_many :usercommentrating
  has_many :comments,through: :usercommentratings
end
