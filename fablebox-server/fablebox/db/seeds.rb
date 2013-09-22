# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ruby encoding: utf-8
Fable.create([{guid:'1000100010001000', name:'Kırmızı Başlıklı Kız', date_added:'2013-08-10 09:00:00', length_in_sec:312, is_paid:0, language:'tr'},
              {guid:'2000200020002000', name:'Pamuk Prenses ve Yedi Cüceler', date_added:'2013-08-10 09:00:00', length_in_sec:384, is_paid:0, language:'tr'},
              {guid:'3000300030003000', name:'Red Riding Hood', date_added:'2013-09-20 09:00:00', length_in_sec:293, is_paid:0, language:'en'},
              {guid:'4000400040004000', name:'Snow White and the Seven Dwarfs', date_added:'2013-09-20 09:00:00', length_in_sec:342, is_paid:0, language:'en'}
              ])

