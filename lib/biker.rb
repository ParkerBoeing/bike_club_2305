class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && ride.total_distance < @max_distance
      (rides[ride] ||= []) << time
    elsif ride.total_distance < @max_distance
      p "#{@name} doesn't know this terrain yet."
      false
    else
      p "#{ride.name} is too long for #{@name}."
      false
    end
  end

  def personal_record(ride)
    if rides.include?(ride)
      personal_best = 99999
      rides[ride].each do |time|
        if time < personal_best
          personal_best = time
        else
        end
      end
      personal_best
    else
      false
    end
  end
end