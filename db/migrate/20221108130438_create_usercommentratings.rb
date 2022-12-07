class CreateUsercommentratings < ActiveRecord::Migration[6.1]
  def change
    create_table :usercommentratings do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :star
      t.timestamps
    end
  end
end
