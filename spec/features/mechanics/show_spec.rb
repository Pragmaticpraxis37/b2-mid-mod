require "rails_helper"

RSpec.describe "mechanics show page", type: :feature do
  before :each do
    @mech_1 = Mechanic.create!(name: "April", years_of_experience: 7)
    @mech_2 = Mechanic.create!(name: "Jane", years_of_experience: 2)
    @mech_3 = Mechanic.create!(name: "Emily", years_of_experience: 10)
    @ride_1 = Ride.create!(name: "The Hulk", thrill_rating: 2, open: true)
    @ride_2 = Ride.create!(name: "The Squid", thrill_rating: 10, open: false)
    @ride_3 = Ride.create!(name: "The Ant", thrill_rating: 5, open: true)
    @ride_4 = Ride.create!(name: "The Capybara", thrill_rating: 5, open: true)
    @mech_1_ride_1 = MechanicRide.create!(mechanic: @mech_1, ride: @ride_1)
    @mech_1_ride_2 = MechanicRide.create!(mechanic: @mech_1, ride: @ride_2)
    @mech_1_ride_3 = MechanicRide.create!(mechanic: @mech_1, ride: @ride_3)
  end

  it "lists an individual mechanic's name, years of experience, and name of ride they're working on" do
    visit "/mechanics/#{@mech_1.id}"

    expect(page).to have_content(@mech_1.name)
    expect(page).to have_content(@mech_1.years_of_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)
    expect(page).to have_content(@ride_3.name)
  end

  it "lists only open rides and listed by descending thrill rating" do
    visit "/mechanics/#{@mech_1.id}"

    within("#open_rides") do
      expect(page).to have_content(@ride_3.name)
      expect(page).to have_content(@ride_1.name)
    end
  end

  it "I see a form to add a ride to the mechanic workload and it displays the new ride on the show page" do
    visit "/mechanics/#{@mech_1.id}"
    save_and_open_page

    fill_in "New Ride", with: "#{@ride_4.id}"


    click_button("Add Ride")

    expect(current_path).to eq("/mechanics/#{@mech_1.id}")

    expect(page).to have_content(@ride_4.name)
  end
end
