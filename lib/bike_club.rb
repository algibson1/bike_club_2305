class BikeClub
  attr_reader :name,
              :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    return nil if @bikers.all? { |biker| biker.rides.empty? }
    sorted_bikers = @bikers.group_by do |biker|
      biker.rides.values.flatten.length
    end
    most_rides = sorted_bikers.keys.max
    record = Hash.new
    record[sorted_bikers[most_rides]] = most_rides
    record
  end

  def best_record(ride)
    return nil if @bikers.none? { |biker| biker.rides.include?(ride) }
    bikers_with_ride = @bikers.select { |biker| biker.rides.include?(ride) }
      bikers_ranked = bikers_with_ride.group_by do |biker|
        biker.rides[ride].sort[0]
      end
    best_time = bikers_ranked.keys.min
    record = Hash.new
    record[bikers_ranked[best_time]] = best_time
    record
  end
end