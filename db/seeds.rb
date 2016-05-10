# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

width_list = [
  ['MIG', 0.8, 0.2],
  ['MIG', 0.9, 0.2],
  ['MIG', 1.0, 0.1],
  ['MIG', 1.1, 0.1],
  ['MIG', 1.2, 0.0],
  ['MIG', 1.3, 0.0],
  ['MIG', 1.4, 0.0],
  ['MIG', 1.5, 0.0],
  ['MIG', 1.6, 0.0],
  ['TIG', 1.6, 0.2],
  ['TIG', 1.8, 0.2],
  ['TIG', 2.0, 0.1],
  ['TIG', 2.2, 0.1],
  ['TIG', 2.4, 0.0],
  ['TIG', 2.6, 0.0],
  ['TIG', 2.8, 0.0],
  ['TIG', 3.0, 0.0],
  ['TIG', 3.2, 0.0],
  ['TIG', 3.4, 0.0],
  ['TIG', 3.6, 0.0]
]

finish_list = [
  ['Matte', 0],
  ['Gloss', 0.1]
]

steel_types_list = [
  ["MIG-307Si", 2.82],
["MIG-ER308L", 2.77],
["MIG-ER308Lsi", 2.87],
["MIG-ER309L", 3.29],
["MIG-ER309Lsi", 3.39],
["MIG-ER316L", 3.30],
["MIG-ER316LSi", 3.40],
["MIG-ER310", 4.28],
["MIG-ER347", 3.47],
["TIG-307Si", 2.62],
["TIG-ER308L", 2.57],
["TIG-ER308LSi", 2.67],
["TIG-ER309LSi", 3.14],
["TIG-ER309Lsi", 3.24],
["TIG-ER316L", 3.20],
["TIG-ER316Lsi", 3.30],
["TIG-ER310", 4.18],
["TIG-ER347", 3.37],
["TIG-ER312", 4.37]
]

width_list.each do |type, width, cost|
  SteelWidth.create(steel_type: type, width: width, cost: cost)
end

finish_list.each do |finish, cost |
  SteelFinish.create(finish: finish, cost: cost)
end

steel_types_list.each do |steel_type, cost |
  SteelType.create(steel_type: steel_type, cost: cost)
end
