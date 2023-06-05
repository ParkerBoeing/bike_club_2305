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
end