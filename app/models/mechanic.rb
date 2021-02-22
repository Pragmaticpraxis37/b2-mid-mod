class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_exp
    average("years_of_experience").to_i
  end

  def working_on_rides
    rides.select("name")
  end

  def open_rides
    rides.where("open = ?", true)
  end
end
