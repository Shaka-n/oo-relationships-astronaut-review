require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#write your test code in here

voyager = Shuttle.new("117", 8)
omicron = Shuttle.new("130", 10)
#wanderer = Shuttle.new("130", 10)

buzz = Astronaut.new("Buzz Aldrin", 45.0, "Geology")
neil = Astronaut.new("Neil Armstrong", 44.0, "Climatology")
chris = Astronaut.new("Chris Hadfield", 49, "Guitar")

mars = Mission.new(2030, voyager, buzz)

venus = Mission.new(2040, voyager, buzz)
voyager.add_astronaut(2040, neil)

jupiter = Mission.new(2050, voyager, buzz)
voyager.add_astronaut(2050, chris)

neptune = Mission.new(2055, omicron, chris)
omicron.add_astronaut(2055, neil)

uranus = Mission.new(2060, voyager, neil)
voyager.add_astronaut(2060, buzz)
chris.join_shuttle(2060, voyager)


binding.pry

puts "Let's go to space!" # just in case pry is buggy and exits
