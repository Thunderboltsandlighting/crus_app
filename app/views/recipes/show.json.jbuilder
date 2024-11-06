json.extract! @recipe, :id, :name, :style, :abv, :ibu, :srm, :description
json.grains @recipe.grains do |grain|
  json.extract! grain, :id, :name, :amount, :uom, :total_cost
end
json.hops @recipe.hops do |hop|
  json.extract! hop, :id, :name, :amount, :uom, :time, :ibu, :hop_type, :total_cost
end
json.yeasts @recipe.yeasts do |yeast|
  json.extract! yeast, :id, :name, :amount, :uom, :total_cost
end
json.miscs @recipe.miscs do |misc|
  json.extract! misc, :id, :name, :amount, :uom, :total_cost
end