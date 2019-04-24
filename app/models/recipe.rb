class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(hash)
    hash.values.each do |ingredient_hash|
      if ingredient_hash[:name].present? && ingredient_hash[:quantity].present?
        self.ingredients.build(ingredient_hash)
      end
    end
  end
end
