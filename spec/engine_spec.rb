require 'spec_helper'

describe Engine do

  describe ".create_parking_lot" do
    it "creates parking lot slot with 6 slots" do
      expect(Engine.create_parking_lot 6).to be_truthy
    end
  end

end