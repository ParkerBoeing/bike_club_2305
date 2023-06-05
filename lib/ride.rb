class Ride
  attr_reader :name, :distance, :terrain, :loop
  def initialize(ride)
    @name = ride[:name]
    @distance = ride[:distance]
    @terrain = ride[:terrain]
    @loop = ride[:loop]
  end

  def loop?
    if @loop
      true
    else
      false
    end
  end

  def total_distance
    if @loop == false
      total_distance = @distance * 2
    else
      total_distance = @distance
    end
    total_distance
  end
end