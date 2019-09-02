class Versement < ApplicationRecord
  belongs_to :user
  belongs_to :ecole
  belongs_to :annee
  belongs_to :etudiant

  default_scope { order(created_at: :desc) }
  scope :annee, -> (annee) { where(annee_id: annee) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }
  scope :etudiant, -> (etudiant) { where(etudiant_id: etudiant) }

end
