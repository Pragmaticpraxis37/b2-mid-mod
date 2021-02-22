require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides }
  end
end 
