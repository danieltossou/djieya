class Ecole < ApplicationRecord

  after_validation :set_slug, only: [:create, :update]
  
  belongs_to :user
  has_many :etudiants
  has_many :users

  default_scope { order(libelle: :asc) }

  private

  def set_slug
    self.slug = libelle.to_s.parameterize
  end

end
