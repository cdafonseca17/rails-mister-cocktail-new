class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true, allow_blank: false
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient }
  validates :ingredient, presence: true
  # validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]
  # validates [:cocktail_id, :ingredient_id], uniqueness: true
end
