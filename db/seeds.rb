# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# URL = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

string = File.read(Rails.root.join('db', 'ingredients.json'))
ingredients = JSON.parse(string)

drinks = ingredients["drinks"]
drinks.each do |ingredient|
  ingredient.each_value do |value|
    Ingredient.new(name:value).save
  end
end



