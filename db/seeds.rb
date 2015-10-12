# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
me = User.create({email: 'zan.loy@sparcedge.com', name: 'Zan Loy', admin: true})

# Lights
beer30 = Light.create(
  {
    name: 'beer30',
    default_red: 'No drinking allowed.',
    default_yellow: 'Drinking is allowed but keep it discrete.',
    default_green: 'Drink up.',
  }
)

# Operators
Operator.create(
  light: beer30,
  user: me,
  admin: true,
)
