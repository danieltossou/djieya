class AddContenanceToClasseRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :classe_rooms, :contenance, :integer, limit: 8
  end
end
