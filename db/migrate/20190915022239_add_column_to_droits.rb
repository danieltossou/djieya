class AddColumnToDroits < ActiveRecord::Migration[6.0]
  def change
    add_column :droits, :creneau, :boolean, default: false
    add_column :droits, :disponibilite, :boolean, default: false
    add_column :droits, :cour, :boolean, default: false
    add_column :droits, :droit, :boolean, default: false
    add_column :droits, :jour, :boolean, default: false
    add_column :droits, :page, :boolean, default: false
  end
end
