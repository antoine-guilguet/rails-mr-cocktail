class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :stars, presence: true
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
end
