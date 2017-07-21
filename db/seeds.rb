# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

USSTATES = [
            "Alabama","Alaska","Arizona","Arkansas",
            "California","Colorado","Connecticut",
            "Delaware",
            "Florida",
            "Georgia",
            "Hawaii",
            "Idaho","Illinois","Indiana","Iowa",
            "Kansas","Kentucky",
            "Louisiana",
            "Maine", "Maryland","Massachusetts","Michigan", "Minnesota","Mississippi", "Missouri","Montana",
            "Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota",
            "Ohio","Oklahoma","Oregon",
            "Pennsylvania",
            "Rhode Island",
            "South Carolina","South Dakota",
            "Tennessee","Texas",
            "Utah",
            "Vermont","Virginia",
            "Washington","West Virginia","Wisconsin","Wyoming"
]


User.destroy_all
State.destroy_all
Park.destroy_all

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_users
    seed.generate_states
  end

  def generate_users
    testAdmin = User.create!( email: 'tadmin@gmail.com',
                              password: '1234567',
                              admin: true
    )

    testUser = User.create!( email: 'tuser@gmail.com',
                             password: '1234567',
                             admin: false
    )
  end

  def generate_states
    USSTATES.each do |i|
      someState = State.create!(name: i)
          2.times do |j|
            someState.parks.create!(name: Faker::Hobbit.location,
                                    description: Faker::Lovecraft.sentences(2),
                                    national_park: false
                                    )
          end
          1.times do |j|
            someState.parks.create!(name: Faker::Hobbit.location,
                                    description: Faker::Lovecraft.sentences(2),
                                    national_park: true
                                    )
          end
    end
  end

end

Seed.begin

p "Created #{User.count} users"
p "Created #{State.count} states"
p "Created #{Park.count} parks"
