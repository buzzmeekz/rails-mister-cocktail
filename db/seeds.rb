# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

file = File.read('db/list.json')
data_hash = JSON.parse(file)
ingredients = data_hash.first[1]

ingredients.each do |a|
  Ingredient.create!(name: a['strIngredient1'])
end