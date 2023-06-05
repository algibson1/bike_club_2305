require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'rspec'

describe BikeClub do
  before do
    @bike_club = BikeClub.new("The Mountain Riders")
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it 'exists' do
    expect(@bike_club).to be_a(BikeClub)
  end

  it 'has a name' do
    expect(@bike_club.name).to eq("The Mountain Riders")
  end

  it 'has no members yet upon being founded' do
    expect(@bike_club.bikers).to eq([])
  end

  it 'can add bikers' do
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    expect(@bike_club.bikers).to eq([@biker1, @biker2])
  end

  it 'can report member with most rides, including ties' do
    expect(@bike_club.most_rides).to eq(nil)
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    @biker2.learn_terrain!(:hills)
    @biker2.learn_terrain!(:gravel)
    @biker2.log_ride(@ride2, 65.0)
    expect(@bike_club.most_rides).to eq({[@biker2] => 1})
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)
    @biker1.log_ride(@ride1, 92.5)
    @biker1.log_ride(@ride1, 91.1)
    @biker1.log_ride(@ride2, 60.9)
    @biker1.log_ride(@ride2, 61.6)
    expect(@bike_club.most_rides).to eq({[@biker1] => 4})
    @biker2.log_ride(@ride2, 60.3)
    @biker2.log_ride(@ride2, 67.0)
    @biker2.log_ride(@ride2, 64.0)
    expect(@bike_club.most_rides).to eq({[@biker1, @biker2] => 4})
  end

  it 'can report who has the best record, including ties' do
    expect(@bike_club.best_record(@ride2)).to eq(nil)
    @bike_club.add_biker(@biker1)
    @bike_club.add_biker(@biker2)
    @biker2.learn_terrain!(:gravel)
    @biker2.log_ride(@ride2, 65.0)
    expect(@bike_club.best_record(@ride2)).to eq({[@biker2] => 65.0})
    @biker1.learn_terrain!(:gravel)
    @biker1.log_ride(@ride2, 60.9)
    @biker1.log_ride(@ride2, 61.6)
    expect(@bike_club.best_record(@ride2)).to eq({[@biker1] => 60.9})
    @biker2.log_ride(@ride2, 60.9)
    expect(@bike_club.best_record(@ride2)).to eq({[@biker1, @biker2] => 60.9})
  end

  it 'can report if a biker is eligible for a ride if terrain is acceptable and total distance does not exceed max distance' do
    expect(@bike_club.eligible?(@biker1, @ride1)).to eq("Member not found")
    @bike_club.add_biker(@biker1)
    expect(@bike_club.eligible?(@biker1, @ride1)).to eq(false)
    @biker1.learn_terrain!(:hills)
    expect(@bike_club.eligible?(@biker1, @ride1)).to eq(true)
    @bike_club.add_biker(@biker2)
    @biker2.learn_terrain!(:hills)
    expect(@bike_club.eligible?(@biker2, @ride1)).to eq(false)
    @biker2.learn_terrain!(:gravel)
    expect(@bike_club.eligible?(@biker2, @ride2)).to eq(true)
  end
end