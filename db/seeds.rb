# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

me = User.create({email: 'zan.loy@sparcedge.com', name: 'Zan Loy', admin: true})
beer30 = Light.create({name: 'beer30', owner: me.id})
