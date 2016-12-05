require_relative 'car'

class Driver

  class << self

    def park(number_plate, color)
      slots = Engine.get_slots
      slot_number = Engine.get_available_slot_number
      capacity = Engine.get_capacity

      if slots.length >= capacity
        puts "Sorry, parking lot is full"
      else
        puts "allocated slot number #{slot_number}"
        slots[slot_number] = Car.new(number_plate,color)
        slot_number+= 1
      end
    end

    def leave(slot_number)
      slots = Engine.get_slots
      slots.delete(slot_number)
    end
  end

end