class AddColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :avg_rating, :integer, default: 0.0
  end
end
