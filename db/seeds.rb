# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  reports
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

require 'faker'

User.create!(
  name: 'constator',
  family_name: 'tator',
  address: Faker::Address.street_address + ', Casablanca,' + 'Maroc',
  identity_number:  Faker::Lorem.characters(number: 9, min_alpha: 4, min_numeric: 2),
  type_of_id_document: 'passport',
  phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
  email: 'tator@gmail.com',
  password: '123456'
)

User.create!(
  name: 'constator',
  family_name: 'toitator',
  address: Faker::Address.street_address + ', Casablanca,' + 'Maroc',
  identity_number:  Faker::Lorem.characters(number: 9, min_alpha: 4, min_numeric: 2),
  type_of_id_document: 'passport',
  phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
  email: 'toitator@gmail.com',
  password: '123456'
)

User.all.each do |user|
  Driver.create!(
    user_id: user.id,
    driver_licence_number: Faker::DrivingLicence.british_driving_licence
  )
end

insurers_list = ['RMA', 'Wafa Assurance', 'AtlantaSanad', 'Axa Assurance Maroc']

5.times do
   InsurancePolicy.create!(
    insured_name: Faker::Name.first_name,
    insured_last_name: Faker::Name.last_name,
    insurance_company_name: insurers_list.sample,
    policy_number: Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1)
   )
end

InsurancePolicy.all.each do |policy|
  InsuranceCertificate.create!(
    insurance_policy_id: policy.id,
    insurance_certification_number: Faker::Lorem.characters(number: 15, min_alpha: 4, min_numeric: 1),
    international_certification_number: Faker::Lorem.characters(number: 20, min_alpha: 4, min_numeric: 2)
  )
end

InsuranceCertificate.all.each do |certificate|
  br = Faker::Vehicle.make
  Vehicle.create!(
    insurance_certificate_id: certificate.id,
    brand: br,
    model: Faker::Vehicle.model(make_of_model: br),
    registration_number: Faker::Vehicle.license_plate,
    chassis_number:Faker::Vehicle.vin,
    gross_weight: rand(500..800)
  )
end
