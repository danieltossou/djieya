class CreateClasseRoomsMatieres < ActiveRecord::Migration[6.0]
  def change
    create_table :classe_rooms_matieres, id: false do |t|
      t.belongs_to :classe_room, null: false, foreign_key: true
      t.belongs_to :matiere, null: false, foreign_key: true
    end
  end
end
