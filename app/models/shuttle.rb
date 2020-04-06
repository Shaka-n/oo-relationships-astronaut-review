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
            if selected_mission.astronauts.find {|astro| astro == astronaut}
                "#{astronaut.name} is already on this mission."
            elsif selected_mission.astronauts.length < self.capacity 
                selected_mission.astronauts << astronaut
                "Astronaut added."
            else
                "Shuttle is at capacity."
            end
        else
            "Creating new Mission."
            Mission.new(launch_date, self, astronaut)
        end
    end

    def current_astronauts
        missions.last.astronauts
    end

    def average_age
        ages = self.current_astronauts.map {|astro| astro.age}
        age_total = ages.inject {|sum, n| sum + n}
        total_astros = self.current_astronauts.length
        avg_age = (age_total / total_astros)
    end

    def astronauts_specialties
        self.current_astronauts.each do |astro|
            puts astro.specialty
        end
    end

    def self.smallest_mission
        Shuttle.all.min do |a, b|
            puts a
            puts b
            a.current_astronauts.length <=> b.current_astronauts.length
        end
    end

    def self.most_common_model
        models = Hash.new(0)
        Shuttle.all.map do |shuttle|
            models[shuttle.model_num] +=1
        end
        model.sort_by{|model,count| count}.last[0]
    end


end
