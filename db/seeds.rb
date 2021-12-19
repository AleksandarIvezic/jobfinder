# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Job.destroy_all
@user = User.create(name: "Company-X", email: "x-mail@example.com", logo: "index.png", password: "password" , password_confirmation: "password")
@user.jobs.create!([{
  name: 'Full-Stack developer',
  description: File.read('public/description-test.html'),
  category: "Hardware design",
  expiring_date: "14-12-2021"
},
{
  name: 'Software Engineer 2 in Microsoft Office AI Platform ',
  description: File.read('public/description-test.html'),
  category: "BackEnd",
  expiring_date: "14-12-2021"
}])