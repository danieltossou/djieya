class Creneau < ApplicationRecord
  belongs_to :user
  belongs_to :ecole

  default_scope { order(debut: :asc) }
end
