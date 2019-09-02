class AddAdminToDossiers < ActiveRecord::Migration[6.0]
  def change
    add_reference :dossiers, :admin, null: true, foreign_key: true
  end
end
