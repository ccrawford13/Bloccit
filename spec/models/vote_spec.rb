require 'rails_helper'

describe Vote do
  describe "validations" do

    before do
      @vote = Vote.new
    end

    describe "value" do
      it "is invalid when greater than 1" do
        @vote.value = 2
        expect(@vote).not_to be_valid
      end

      it "is valid when equal to 1" do
        @vote.value = 1
        expect(@vote).to be_valid
      end
    end
  end
end
