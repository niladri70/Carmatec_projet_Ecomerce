# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user=User.new
user.fname = 'Admin' 
user.lname = 'carmatec'
user.email = 'admin@c.com'
user.role_id = 1
user.password ='123456789'
user.password_confirmation = '123456789'
user.gender='male'
user.save!