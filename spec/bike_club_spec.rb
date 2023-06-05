require './lib/ride'
require './lib/biker'
require './lib/bike_club'
require 'rspec'

describe BikeClub do
  before do
    @bike_club = BikeClub.new("The Mountain Riders")
    @biker1 = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
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
end