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
end