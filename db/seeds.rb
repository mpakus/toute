# eNNNcoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.destroy_all
cities = City.create([{ alias:'ufa', name:'Уфа' }, { alias:'kazan', name:'Казань' }, { alias:'chelny', name:'Набережные Челны' }])

Operation.destroy_all
operations = Operation.create([{ alias:'buy', name:'Куплю' }, { alias:'sale', name:'Продам' }, { alias:'exchange', name:'Обмен' }])

Category.destroy_all
#categories = Category.create([{ alias:'buy', name:'Куплю' }, { alias:'sale', name:'Продам' }, { alias:'exchange', name:'Обмен' }])
