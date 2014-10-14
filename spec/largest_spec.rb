require "spec_helper"
require "largest"   # name of the class we have just created
 
describe Largest do
  describe "#find_largest" do
    it "finds the largest number in the array" do
      largest_number = Largest.find_largest([1,4,2])
      expect(largest_number).to eq(4)
    end
    it "finds the largest number in the array" do
      largest_number = Largest.find_largest([-1,-3,3])
      expect(largest_number).to eq(3)
    end
  end
end