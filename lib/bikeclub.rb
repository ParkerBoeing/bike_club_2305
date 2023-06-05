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
    highest_number_of_rides = 0
    most_ridden = nil
    @bikers.each do |biker|
      if biker.rides.values.flatten.length > highest_number_of_rides
        highest_number_of_rides = biker.rides.values.flatten.length
        most_ridden = biker
      else
      end
    end
    most_ridden
  end

  def best_time(ride)
    fastest_time = 999999
    biker_with_fastest_time = nil
    @bikers.each do |biker|
      if biker.rides.include?(ride)
        biker.rides[ride].each do |time|
          if time < fastest_time
            fastest_time = time
            biker_with_fastest_time = biker
          else
          end
        end
      else
      end
    end
    biker_with_fastest_time
  end

  # def start_group_ride(ride)
  #   times = {}
  #   @bikers.each do |biker|
  #     if @acceptable_terrain.include?(ride.terrain) && ride.total_distance < @max_distance
  #       biker_data = {
  #         start_time: Time.now.to_i,
  #         finish_time: nil
  #       }
  #       times[biker] = biker_data
  #      end
  #   end
  # end
end