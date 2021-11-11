# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'
LabAnalysis.destroy_all
LabAnalysis.create!(analysis_name: "Sm-Nd")
LabAnalysis.create!(analysis_name: "Sr-Sr")
LabAnalysis.create!(analysis_name: "C-O")
LabAnalysis.create!(analysis_name: "U-Pb (Ígneo)")
LabAnalysis.create!(analysis_name: "U-Pb (Detrítico)")
LabAnalysis.create!(analysis_name: "U-Pb (carbonato)")
LabAnalysis.create!(analysis_name: "Imageamento (ICP-MS)")
LabAnalysis.create!(analysis_name: "MEV")
LabAnalysis.create!(analysis_name: "SelFrag")
LabAnalysis.create!(analysis_name: "Pulverização de Amostra")
puts "Finished!"
