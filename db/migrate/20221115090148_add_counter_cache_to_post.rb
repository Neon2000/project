class AddCounterCacheToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comments_count, :integer, default: 0
    Post.find_each {|post| Post.reset_counters(post.id, :comments)}
  end
end
