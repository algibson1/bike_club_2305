require './lib/ride'
require 'rspec'

describe Ride do
  before do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it 'exists' do
    expect(@ride1).to be_a(Ride)
    expect(@ride2).to be_a(Ride)
  end

  it 'has a name' do
    expect(@ride1.name).to eq("Walnut Creek Trail")
    expect(@ride2.name).to eq("Town Lake")
  end

  it 'has a distance' do
    expect(@ride1.distance).to eq(10.7)
    expect(@ride2.distance).to eq(14.9)
  end

  it 'has a terrain type' do
    expect(@ride1.terrain).to eq(:hills)
    expect(@ride2.terrain).to eq(:gravel)
  end

  it 'might be a loop or out-and-back' do
    expect(@ride1.loop?).to eq(false)
    expect(@ride2.loop?).to eq(true)
  end

  it 'has a total distance, based on trail type being a loop or out-and-back' do
    expect(@ride1.total_distance).to eq(21.4)
    expect(@ride1.total_distance).to eq(14.9)
  end
end