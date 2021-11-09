# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database'
LabAnalysis.destroy_all
LabAnalysis.create!(analysis_name: "sm_nd")
LabAnalysis.create!(analysis_name: "sr_sr")
LabAnalysis.create!(analysis_name: "c_o")
LabAnalysis.create!(analysis_name: "u_pb_ign")
LabAnalysis.create!(analysis_name: "u_pb_det")
LabAnalysis.create!(analysis_name: "u_pb_carb")
LabAnalysis.create!(analysis_name: "imageamento")
LabAnalysis.create!(analysis_name: "mev")
LabAnalysis.create!(analysis_name: "selfrag")
LabAnalysis.create!(analysis_name: "pulverização")
puts "Finished!"
