require "rails_helper"

RSpec.describe "mechanics index page", type: :feature do
  before :each do
    @mech_1 = Mechanic.create!(name: "April", years_of_experience: 7)
    @mech_2 = Mechanic.create!(name: "Jane", years_of_experience: 2)
    @mech_3 = Mechanic.create!(name: "Emily", years_of_experience: 10)
  end

  it "lists all mechanic names and their years of experience" do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(@mech_1.name)
    expect(page).to have_content(@mech_1.years_of_experience)
    expect(page).to have_content(@mech_2.name)
    expect(page).to have_content(@mech_2.years_of_experience)
    expect(page).to have_content(@mech_3.name)
    expect(page).to have_content(@mech_3.years_of_experience)
  end

  it "lists the average years of experience of all the mechanics" do
    visit "/mechanics"

    expect(page).to have_content("Average Years of Experience: 6")
  end
end
