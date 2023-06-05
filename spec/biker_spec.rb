require './lib/ride'
require './lib/biker'
require 'rspec'

describe Biker do
  it 'can initialize' do
    biker = Biker.new("Kenny", 30)
    expect(biker).to be_a Biker
  end

  it 'has a name, max distance, empty rides hash, and empty acceptable terrain array' do
    biker = Biker.new("Kenny", 30)
    expect(biker.name).to eq("Kenny")
    expect(biker.max_distance).to eq(30)
    expect(biker.rides).to eq({})
    expect(biker.acceptable_terrain).to eq([])
  end

  it 'can add new terrain' do
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    expect(biker.acceptable_terrain).to eq([:gravel, :hills])
  end

  it 'can log rides' do
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
    expected = {
      ride1 => [92.5, 91.1],
      ride2 => [60.9, 61.6]
    }
    expect(biker.rides).to eq expected
  end

  it 'can only allow bikers on rides with learned terrain types and under the bikers max distance' do
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
    biker2 = Biker.new("Athena", 15)
    expect(biker2.log_ride(ride1, 97.0)).to be false
    expect(biker2.log_ride(ride2, 67.0)).to be false
    expect(biker2.rides).to eq({})
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    expect(biker2.log_ride(ride1, 97.0)).to be false
    biker2.log_ride(ride2, 65.0)
    expected = {
      ride2 => [65.0]
    }
    expect(biker2.rides).to eq expected
  end

  it 'can find the personal record of a ridden course' do
    biker = Biker.new("Kenny", 30)
    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker.log_ride(ride2, 60.9)
    biker.log_ride(ride2, 61.6)
    biker2 = Biker.new("Athena", 15)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    biker2.log_ride(ride2, 65.0)
    expect(biker.personal_record(ride1)).to eq 91.1
    expect(biker.personal_record(ride2)).to eq 60.9
    expect(biker2.personal_record(ride2)).to eq 65.0
    expect(biker2.personal_record(ride1)).to eq false
  end
end