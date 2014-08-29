# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
admin = User.create!( firstname: 'Admin',
              lastname: 'Admin',
              email: 'a@a.com',
              # admin: true, # use rolify instead of a db flag
              address: '123 Fake Street',
              city: 'Seattle',
              state: 'WA',
              phone: '123-444-5556',
              password: '12345678',
              password_confirmation: '12345678'
)

admin.add_role "admin"

#Normie
normie = User.create!( firstname: 'Tom',
              lastname: 'Fakerson',
              email: 'b@b.com',
              # admin: false,
              address: '123 Fake Street',
              city: 'Seattle',
              state: 'WA',
              phone: '123-444-5556',
              password: '12345678',
              password_confirmation: '12345678'
)

book = Book.create!( author: 'Steven King',
              title: 'IT',
              status: 'Available',
              isbn: '32T09JV4OV4IN3409J',
              active: true,
              approved_at: Time.now

  )

Book.create!( author: 'Stephen Baxter',
              title: 'Vacuum Diagrams',
              status: 'Available',
              isbn: '0061059048',
              active: true,
              approved_at: Time.now
)

Rating.create!(user: normie,
               book: book,
               score: 3)
