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

  end

  def most_rides

  end

  def best_time(ride)
    
  end
end