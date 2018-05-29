require "rails_helper"
require "string_calc"

describe StringCalc do

  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
        expect(StringCalc.add("")).to eql(0)
      end
    end
    
    context "given '2,4'" do
      it "returns 6" do
        expect(StringCalc.add("2,4")).to eql(6)
      end
    end

    context "given '17,100'" do
      it "returns 117" do
        expect(StringCalc.add("17,100")).to eql(117)
      end
    end 

    context "given '4'" do
      it "returns 4" do
        expect(StringCalc.add("4")).to eql(4)
      end
    end
 
    context "give '10,10'" do
      it "does not return 12" do
        expect(StringCalc.add("10,10")).not_to eq(12)
      end
    end

    context "give '10'" do
      it "returns 10" do
        expect(StringCalc.add("10")).to eql(10)
      end
    end
  end  
end

RSpec.describe Game, :type => :model do

  subject {described_class.new}

  it "is valid with valid attributes" do
    subject.name = "Anything"
    expect(subject).to be_valid
  end



end

