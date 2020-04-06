class Shuttle
    attr_reader :capacity, :model_num
    @@all = []
    def initialize(model_num,capacity)
        @model_num = model_num
        @capacity = capacity
        Shuttle.all << self
    end

    def self.all
        @@all
    end

    def self.find_by_model(model_num)
        Shuttle.all.find {|shuttle| shuttle.model_num == model_num}
    end

    def missions
        Mission.all.select {|mission| mission.shuttle == self}
    end

    def find_mission_by_date(launch_date)
        missions.find {|mission| mission.launch_date == launch_date}
    end

    def add_astronaut(launch_date, astronaut)
        
        selected_mission = find_mission_by_date(launch_date)
        if selected_mission
            if selected_mission.astronauts.length < self.capacity
                selected_mission.astronauts << astronaut
                "Astronaut added."
            else
                "Shuttle is at capacity."
            end
        else
            Mission.new(launch_date, self, astronaut)
        end
    end

    def current_astronauts
        missions.last.astronauts
    end


end
