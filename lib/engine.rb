require 'parking_lot'

class Engine

  class << self

    def create_parking_lot(capacity)
      @parking_lot = ParkingLot.new(capacity)
    end

  end
end

