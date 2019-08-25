class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :crea_user, :integer, limit: 8
  end
end
