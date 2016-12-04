class ParkingLot

  attr_accessor :capacity, :slots, :slot_number

  def initialize(capacity)
    @capacity = capacity
    @slots = Hash.new
    @slot_number = 1
  end
end
