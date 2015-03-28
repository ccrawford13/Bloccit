require 'rails_helper'
include TestFactories

describe Vote do
  describe "validations" do
    describe "value validations" do
      it "it is valid when value is 1" do
        up_vote = Vote.new(value: 1)
        expect( up_vote.valid? ).to eq(true)
      end

      it "it is valid when value is -1" do
        down_vote = Vote.new(value: -1)
        expect( down_vote.valid? ).to eq(true)
      end

      it "it is invalid when value is 0" do
        invalid_vote = Vote.new(value: 0)
        expect( invalid_vote.valid? ).to eq(false)
      end

      it "it is invalid when value is greater than 1" do
        invalid_vote = Vote.new(value: 2)
        expect( invalid_vote.valid? ).to eq(false)
      end

      it "it is invalid when value is less than -1" do
        invalid_vote = Vote.new(value: -2)
        expect( invalid_vote.valid? ).to eq(false)
      end
    end
  end

  describe "after_save" do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect( post ).to receive(:update_rank)
      vote.save
    end
  end
end