class Caisse < ApplicationRecord
  belongs_to :ecole
  belongs_to :annee

  default_scope { order(created_at: :desc) }
  scope :entrée, -> { where(operation: 'entrée') }
  scope :sortie, -> { where(operation: 'sortie') }
  scope :annee, -> (annee) { where(annee_id: annee) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }


end
