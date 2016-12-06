require 'spec_helper'

describe Driver do

  before do
    @parking_lot = Engine.create_parking_lot 2
    @slots = Engine.get_slots
    @slot_number = Engine.get_available_slot_number
    @capacity = Engine.get_capacity

    @park1 = Driver.park('KA­01­HH­1234', 'White')
    @park2 = Driver.park('KA­01­HH­9999', 'White')

  end

  describe ".park" do
    context "when parking space is available" do
      it "should be able to park the car to the parking lot" do
        expect(@park1).to be_truthy
        expect(@park2).to be_truthy
      end
    end

    context "when parking space is full" do
      it 'should be not able to park the car' do
        park3 = Driver.park('KA­01­BB­0001', 'Black')
        expect(park3).to be_falsey
      end
    end
  end

  describe ".leave" do
    it "should removes associated slot" do
      @slots.delete(1)
      expect(@slots[1]).to be_nil
    end
  end

end