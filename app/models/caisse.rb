class Caisse < ApplicationRecord
  belongs_to :user
  belongs_to :ecole
  belongs_to :annee

  scope :entrée, -> { where(operation: 'entrée') }
  scope :sortie, -> { where(operation: 'sortie') }
  scope :recup, -> (annee){ where(annee_id: annee) }


end
