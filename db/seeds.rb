# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
steel_types_list = %w(MIG TIG)

width_mig_list = [
  [0.8, 0.2],
  [0.9, 0.2],
  [1.0, 0.1],
  [1.1, 0.1],
  [1.2, 0.0],
  [1.3, 0.0],
  [1.4, 0.0],
  [1.5, 0.0],
  [1.6, 0.0]
]

width_tig_list = [
  [1.6, 0.2],
  [1.8, 0.2],
  [2.0, 0.1],
  [2.2, 0.1],
  [2.4, 0.0],
  [2.6, 0.0],
  [2.8, 0.0],
  [3.0, 0.0],
  [3.2, 0.0],
  [3.4, 0.0],
  [3.6, 0.0]
]

finish_list = [
  ['Matte', 0],
  ['Gloss', 0.1]
]

steel_grade_mig_list = [
  ['307Si', 2.82],
  ['ER308L', 2.77],
  ['ER308Lsi', 2.87],
  ['ER309L', 3.29],
  ['ER309Lsi', 3.39],
  ['ER316L', 3.30],
  ['ER316LSi', 3.40],
  ['ER310', 4.28],
  ['ER347', 3.47]
]

steel_grade_tig_list = [
  ['307Si', 2.62],
  ['ER308L', 2.57],
  ['ER308LSi', 2.67],
  ['ER309LSi', 3.14],
  ['ER309Lsi', 3.24],
  ['ER316L', 3.20],
  ['ER316Lsi', 3.30],
  ['ER310', 4.18],
  ['ER347', 3.37],
  ['ER312', 4.37]
]

transport_types_list = [
  ['Ex works', 0, 0],
  ['CIF', 1000, 0.45],
  ['CIF', 2000, 0.3],
  ['CIF', 5_000, 0.25],
  ['CIF', 20_000, 0.15],
  ['FOB', 1000, 0.25],
  ['FOB', 2000, 0.15],
  ['FOB', 5_000, 0.10],
  ['FOB', 20_000, 0.05]
]

steel_types_list.each do |type|
  SteelType.create(steel_type: type)
end

mig = SteelType.all.first
tig = SteelType.all.last

width_mig_list.each do |width, cost|
  mig.steel_widths.create(width: width, cost: cost)
end

width_tig_list.each do |width, cost|
  tig.steel_widths.create(width: width, cost: cost)
end

finish_list.each do |finish, cost|
  SteelFinish.create(finish: finish, cost: cost)
end

steel_grade_mig_list.each do |grade, cost|
  mig.steel_grades.create(grade: grade, cost: cost)
end

steel_grade_tig_list.each do |grade, cost|
  tig.steel_grades.create(grade: grade, cost: cost)
end

transport_types_list.each do |type, range_start, cost|
  TransportType.create(transport_type: type,
                       range_start: range_start,
                       cost: cost)
end
