User.destroy_all

AdminUser.create! name:  'Admin', email: 'admin@motohelper.pl', password: 'mh1234'
RegularUser.create! name:  'Igor Wspaniały', email: 'igor@motohelper.pl', password: 'igor1234'

puts "Seeds have been added."
