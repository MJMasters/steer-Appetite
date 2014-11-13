# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pubs = Pub.create([{ name: 'Chicago',address:"Holy Town",rating: 5, latitude: 0.000, longitude: 51.526124}, { name: 'Little Shop of Horror',address:"Greenwich", rating: 1, latitude: 0 , longitude: 51}])
