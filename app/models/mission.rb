class Mission
    attr_accessor :launch_date, :astronauts, :shuttle
    @@all = []
    def initialize(launch_date, shuttle, astronaut)
        @astronauts= []
        @astronauts << astronaut
        @launch_date = launch_date
        @shuttle = shuttle
        Mission.all << self
    end

    def self.all
        @@all
    end

    def self.find_by_date(launch_date)
        Mission.all.find {|mission| mission.launch_date == launch_date}
    end


end
