class RemoveReferncrsToPost < ActiveRecord::Migration[6.1]
  def change
    remove_reference :posts , :users ,foreign_kry: true
    remove_reference :comments , :users ,foreign_kry: true
  end
end
