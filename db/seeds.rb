Faker::Config.locale = 'en-US'

#seed DB with roles
roles = ["fm_admin", "fm_rep", "client_admin", "client_contact", "provider"]

roles.each do |r|
  Role.create!(role_type: r)
end

# seed DB with 20 client_admin Users
20.times do |n|
  name = Faker::Name.name
  email = "admin@hospital#{n+1}.org"
  password = "foobarcadmin"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: 3 )
end

# seed DB with 40 client_contact users
20.times do |n|
  name = Faker::Name.name
  email = "contact@hospital#{n+1}.org"
  password = "foobarcontact"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: 4 )
end

20.times do |n|
  name = Faker::Name.name
  email = "contact2@hospital#{n+1}.org"
  password = "foobarcontact"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: 4 )
end

# seed DB with 1 fm_admin User
1.times do |n|
  name = 'Sammy Director'
  email = "sam_director@fleetmed.org"
  password = "fmed2017"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: 1,
                admin: true )
end

# seed DB with 15 fm_rep Users
15.times do |n|
  name = Faker::Name.name
  email = "rep#{n+1}@fleetmed.org"
  password = "foobarrep"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: 2 )
end

# seed DB with 75 providers
75.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "foobarprovider"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password,
                role_id: 5 )
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

# seed DB with States
states.each do |s|
  State.create!( name: s[1],
                 abbreviation: s[0])
end

# seed DB with clients
20.times do |n|
  name = Faker::Company.name
  address = Faker::Address.street_address
  website = Faker::Internet.url
  phone = Faker::PhoneNumber.phone_number
  random = rand(1...51)
  client = Client.create!(name: name,
                 address: address,
                 state_id: random,
                 main_phone: phone,
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

# seed DB with 75 providers
75.times do |n|
  random_exp = rand(1..7)
  random_state_ids = [ rand(1..51) , rand(1..51) ]
  random_specialty_ids = [ rand(1..7) , rand(1..7) ]
  Provider.create!( experience: random_exp,
                    user_id: n + 77,
                    state_ids: random_state_ids,
                    specialty_ids: random_specialty_ids )
end

# seed DB with 40 contacts
40.times do |n|
  random_client = rand(1..20)
  Contact.create!( client_id: random_client,
                   job_title: "Physician Recruiter",
                   user_id: n + 21 )
end

# seed dB with 15 fm_reps
15.times do |n|
  random_user = rand(62..76)
  random_nickname = "@" + Faker::Name.first_name + Faker::Superhero.suffix
  random_cell = Faker::PhoneNumber.cell_phone
  random_work = Faker::PhoneNumber.phone_number
  random_birthdate = Faker::Date.birthday(18, 40)
  FmRep.create!( user_id: random_user,
                  nickname: random_nickname,
                  cell_number: random_cell,
                  work_number: random_work,
                  birthday: random_birthdate )
end

# seed DB with 33 work sites
33.times do |n|
  random_client = rand(1..20)
  address = Faker::Address.street_address
  random_state = rand(1..51)
  WorkSite.create!( client_id: random_client,
                    address: address,
                    state_id: random_state )
end

# seed DB with 21 jobs
21.times do |n|
  random_client = rand(1..20)
  random_specialties = [rand(1..7)]
  random_state = [rand(1..51)]
  random_rep = rand(1..15)
  Job.create!( client_id: random_client,
               specialty_ids: random_specialties,
               state_ids: random_state,
               fm_rep_ids: random_rep )
 current_job = Job.find(n+1)
 current_client_id = current_job.client_id
 all_contacts = Contact.where(client: current_client_id).ids
 current_job.contact_ids = all_contacts
end

# seed DB with 20 submissions
20.times do |n|
  random_job = rand(1..21)
  random_provider = rand(1..75)
  Submission.create!( job_id: random_job,
                      provider_id: random_provider )
end
