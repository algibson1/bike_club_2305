class Ride
  attr_reader :name,
              :distance,
              :loop,
              :terrain
  def initialize(ride_stats)
    @name = ride_stats[:name]
    @distance = ride_stats[:distance]
    @loop = ride_stats[:loop]
    @terrain = ride_stats[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    return @distance if @loop
    @distance * 2
  end
end