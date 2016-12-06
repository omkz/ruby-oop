require 'spec_helper'

describe Engine do

  before do
    @parking_lot = Engine.create_parking_lot 2
    @slots = @parking_lot.slots
    @slot_number = @parking_lot.slot_number
    @capacity = @parking_lot.capacity

  end

  describe ".create_parking_lot" do
    it "creates parking lot slot with 6 slots" do
      expect(@parking_lot).to be_truthy
    end
  end

  describe ".status" do
    it "returns slots status" do
      park1 = Driver.park('KA­01­HH­1234', 'White')
      park2 = Driver.park('KA­01­HH­9999', 'White')

      cars = @parking_lot.slots.select{|key, value| value.color == "White" }
      number_plates = cars.map{|k,v| "#{v.number_plate}"}.join(',')

      expect(@parking_lot.slots).to include 1
      expect(number_plates).to include 'KA­01­HH­1234'
    end
  end

  it "returns slots as a hash" do
    expect(@slots).to eq({})
  end

  it "returns first slot number" do
    expect(@slot_number).to eq(1)
  end

  it "returns a parking lot with 2 slot" do
    expect(@capacity).to eq 2
  end

  it "returns number plate of car with by color"do
    park1 = Driver.park('KA­01­HH­1234', 'White')
    park2 = Driver.park('KA­01­HH­9999', 'White')

    cars = @parking_lot.slots.select{|key, value| value.color == "White" }
    number_plates = cars.map{|k,v| "#{v.number_plate}"}.join(',')

    expect(number_plates).to eq "KA­01­HH­1234,KA­01­HH­9999"
  end

  it "returns slot numbers for cars by colour" do
    park1 = Driver.park('KA­01­HH­1234', 'White')
    park2 = Driver.park('KA­01­HH­9999', 'White')

    cars = @parking_lot.slots.select{|key, value| value.color == "White" }
    slot_numbers = cars.map{|k,v| "#{k}"}.join(',')

    expect(slot_numbers).to eq("1,2")

  end

  it "returns slot number by number plate" do
    park1 = Driver.park('KA­01­HH­1234', 'White')
    park2 = Driver.park('KA­01­HH­9999', 'White')

    cars = @parking_lot.slots.select{|key, value| value.number_plate == "KA­01­HH­1234" }
    slot_number = cars.map{|k,v| "#{k}"}.join(',')

    expect(slot_number.to_i).to eq 1
  end

end