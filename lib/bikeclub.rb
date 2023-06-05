class BikeClub
  attr_reader :name, :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def can_ride?(ride)
  can_ride = []
  @bikers.each do |biker|
      if biker.acceptable_terrain.include?(ride.terrain) && ride.total_distance < biker.max_distance
        can_ride << biker
      else
        false
      end
    end
    can_ride
  end

  def most_rides

  end

  def best_time(ride)

  end
end