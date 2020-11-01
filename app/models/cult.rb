require 'pry'

class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize name, location, founding_year, slogan
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(follower, initiation_date)
      Bloodoath.new(self, follower, initiation_date) #call using cult_name.recruit_follower(follower name)
    end

    def self.all #returns all the cults
      @@all
    end

    def all_oaths #helper method
        Bloodoath.all.select do |oath|
            oath.cult == self
        end
    end

    def cult_population
       all_oaths.length
    end

    def self.find_by_name(name)
      all.find do |cult|
        cult.name == name
      end
    end

    def self.find_by_location(location)
        all.find { |cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        all.find do |cult|
            cult.founding_year == year
        end
    end

    def followers #helper method
        all_oaths.map do |oath|
            oath.follower
        end
    end

    def average_age
        followers.reduce(0) do |ages, follower|
            ages + follower.age.to_f
        end/followers.count.to_f
    end

end