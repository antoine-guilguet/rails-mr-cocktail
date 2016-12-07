class AddStarsToCocktails < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :stars, :integer
  end
end
