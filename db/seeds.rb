# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Plan.create(:plan_name => 'Basic' ,:amount => 100 ,:currency => 'usd')

Plan.create(:plan_name => 'silver' ,:amount => 1000 ,:currency => 'usd')

Plan.create(:plan_name => 'Gold' ,:amount => 5000 ,:currency => 'usd')