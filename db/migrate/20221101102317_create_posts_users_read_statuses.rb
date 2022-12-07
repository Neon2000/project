class CreatePostsUsersReadStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_users_read_statuses do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
