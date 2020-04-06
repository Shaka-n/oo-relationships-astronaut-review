class Astronaut
    attr_reader :name
    attr_accessor :age, :specialty
    @@all = []
    def initialize(name, age, specialty)
        @name = name
        @age = age
        @specialty = specialty
        Astronaut.all << self
    end

    def self.all
        @@all
    end

    def missions
        Mission.all.select {|mission| mission.astronauts.find{|astronaut| astronaut ==self}}
    end

    def total_missions
        missions.length
    end
    

    def find_mission_by_date(launch_date)
        Mission.all.find {|mission| mission.launch_date == launch_date}
    end

    def join_shuttle(launch_date, shuttle)
        selected_mission = find_mission_by_date(launch_date)
        if selected_mission
            if selected_mission.astronauts.length < shuttle.capacity
                selected_mission.astronauts << self
                "Astronaut added."
            else
                "Shuttle is at capacity."
            end
        else
            "New Mission Created."
            Mission.new(launch_date, shuttle, self)
        end
    end

    def self.most_missions
        Astronaut.all.max do |a, b|
            a.total_missions <=> b.total_missions
        end
    end
  
end
