# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  {:title => "Bebidas",     :position => 1},
  {:title => "Postres",  :position => 5},
  {:title => "Sopas",    :position => 3},
  {:title => "Platos fuertes",  :position => 4},
  {:title => "Entradas", :position => 2}
  
].each do |attributes|
  Category.find_or_create_by_title(attributes)
end
