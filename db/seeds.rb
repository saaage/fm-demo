# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# User.create!(name: "Admin User",
#              email: "admin@fleetmed.org",
#              password: "foobar",
#              password_confirmation: "foobar",
#              admin: true)

#seed DB with roles
roles = ["fm_admin", "fm_rep", "client_admin", "client_contact", "provider"]

roles.each do |r|
  Role.create!(role_type: r)
end

# seed DB with users
30.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@fleetmed.org"
  password = "password"
  random = rand(1..5)
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: random )
end

states = Array[ ["AK", "Alaska"],
                ["AL", "Alabama"],
                ["AR", "Arkansas"],
                ["AS", "American Samoa"],
                ["AZ", "Arizona"],
                ["CA", "California"],
                ["CO", "Colorado"],
                ["CT", "Connecticut"],
                ["DC", "District of Columbia"],
                ["DE", "Delaware"],
                ["FL", "Florida"],
                ["GA", "Georgia"],
                ["GU", "Guam"],
                ["HI", "Hawaii"],
                ["IA", "Iowa"],
                ["ID", "Idaho"],
                ["IL", "Illinois"],
                ["IN", "Indiana"],
                ["KS", "Kansas"],
                ["KY", "Kentucky"],
                ["LA", "Louisiana"],
                ["MA", "Massachusetts"],
                ["MD", "Maryland"],
                ["ME", "Maine"],
                ["MI", "Michigan"],
                ["MN", "Minnesota"],
                ["MO", "Missouri"],
                ["MS", "Mississippi"],
                ["MT", "Montana"],
                ["NC", "North Carolina"],
                ["ND", "North Dakota"],
                ["NE", "Nebraska"],
                ["NH", "New Hampshire"],
                ["NJ", "New Jersey"],
                ["NM", "New Mexico"],
                ["NV", "Nevada"],
                ["NY", "New York"],
                ["OH", "Ohio"],
                ["OK", "Oklahoma"],
                ["OR", "Oregon"],
                ["PA", "Pennsylvania"],
                ["PR", "Puerto Rico"],
                ["RI", "Rhode Island"],
                ["SC", "South Carolina"],
                ["SD", "South Dakota"],
                ["TN", "Tennessee"],
                ["TX", "Texas"],
                ["UT", "Utah"],
                ["VA", "Virginia"],
                ["VI", "Virgin Islands"],
                ["VT", "Vermont"],
                ["WA", "Washington"],
                ["WI", "Wisconsin"],
                ["WV", "West Virginia"],
                ["WY", "Wyoming"] ]

# seed DB with our States
states.each do |s|
  State.create!( name: s[1],
                 abbreviation: s[0])
end

# seed DB with clients
10.times do |n|
  name = Faker::Company.name
  address = Faker::Address.street_address
  website = Faker::Internet.url
  random = rand(1...51)
  client = Client.create!(name: name,
                 address: address,
                 state_id: random,
                 website: website )
end

specialties = Array[ ["Physician", "Family Medicine"],
                     ["Physician", "Internal Medicine"],
                     ["Physician", "Internal Medicine", "Cardiologist"],
                     ["Physician", "OBGYN"],
                     ["Physician", "Pediatrician"],
                     ["Physician", "Internal Medicine", "Gastroenterologist"],
                     ["Physician", "Pediatrician", "Cardiologist"] ]

specialties.each do |s|
  Specialty.create!( provider_type: s[0],
                     specialty: s[1],
                     sub_specialty: s[2])
end

# seed DB with providers
# 20.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n+1}@fleetmed.com"
#   Provider.create!(name: name,
#                    email: email,
#                    experience: rand(1...22) )
# end
