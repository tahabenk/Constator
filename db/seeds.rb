# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Report.destroy_all
ReportStatus.destroy_all
puts "database cleaned"
@status1 = ReportStatus.create(status_description:'started')
@report1 = Report.new(address: "here", observations: "nothing") #add more
@report1.report_status = @status1
@report1.save
puts "report1 created"
@report2 = Report.new(address: "here", observations: "nothing") #add more
@report2.report_status = @status1
@report2.save
puts "report2 created"
