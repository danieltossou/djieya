class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :admin, null: true, foreign_key: true
  end
end
