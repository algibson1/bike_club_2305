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
    @bikers.max_by do |biker|
      biker.rides.values.flatten.length
    end
  end

  def best_record(ride)
    bikers_with_ride = @bikers.select { |biker| biker.rides.include?(ride) }
      bikers_with_ride.min_by do |biker|
        biker.rides[ride].sort[0]
      end
  end
end