class AddReferncrsToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts , :user ,foreign_kry: true
    add_reference :comments , :user ,foreign_kry: true
  end
end
