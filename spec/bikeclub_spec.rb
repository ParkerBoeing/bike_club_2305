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
end