User.destroy_all

AdminUser.create!(
  name:  'Admin',
  email: 'admin@motohelper.pl',
  password: 'mh1234',
  confirmed_at: Date.today
)

RegularUser.create!(
  name:  'Igor Wspaniały',
  email: 'igor@motohelper.pl',
  password: 'igor1234',
  confirmed_at: Date.today
)

puts "Seeds have been added."
