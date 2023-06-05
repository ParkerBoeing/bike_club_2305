require './lib/ride'
require './lib/biker'
require './lib/bikeclub'
require 'rspec'

describe BikeClub do
  it 'can initialize' do
    ubc = BikeClub.new("Utah Bike Club")
    expect(ubc).to be_a BikeClub
  end

  it 'has a name and an empty array of bikers' do
    ubc = BikeClub.new("Utah Bike Club")
  end

  it 'can add bikers to the array' do
    ubc = BikeClub.new("Utah Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    ubc.add_biker(biker)
    ubc.add_biker(biker2)
    expect(ubc.bikers).to eq [biker, biker2]
  end

  it 'can provide a list of eligible riders for a trail' do
    ubc = BikeClub.new("Utah Bike Club")
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    biker2 = Biker.new("Athena", 15)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    ubc.add_biker(biker)
    ubc.add_biker(biker2)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    expect(ubc.can_ride?(ride1)).to eq [biker]
    expect(ubc.can_ride?(ride2)).to eq [biker, biker2]
  end

  it 'can determine which biker has done the most rides' do
    ubc = BikeClub.new("Utah Bike Club")
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    biker2 = Biker.new("Athena", 15)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    ubc.add_biker(biker)
    ubc.add_biker(biker2)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
    biker2.log_ride(ride2, 65.0)
    expect(ubc.most_rides).to eq biker
  end

  it 'can determine who has the best time on a given ride' do
    ubc = BikeClub.new("Utah Bike Club")
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    biker2 = Biker.new("Athena", 15)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    ubc.add_biker(biker)
    ubc.add_biker(biker2)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
    biker2.log_ride(ride2, 59.0)
    expect(ubc.best_time(ride1)).to eq biker
    expect(ubc.best_time(ride2)).to eq biker2
  end
end