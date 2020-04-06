require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#write your test code in here

voyager = Shuttle.new("117", 8)
buzz = Astronaut.new("Buzz Aldrin", 45, "Geology")
neil = Astronaut.new("Neil Armstrong", 44, "Climatology")
mars = Mission.new(2030, voyager, buzz)
venus = Mission.new(2040, voyager, buzz)
jupiter = Mission.new(2050, voyager, buzz)
uranus = Mission.new(2060, voyager, neil)


binding.pry

puts "Let's go to space!" # just in case pry is buggy and exits
