require "rails_helper"

RSpec.describe "Outing Show Page", type: :feature do
  let!(:bachelorette_1) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!") }
  let!(:bachelorette_2) { Bachelorette.create!(name: "Rachel Lindsay", season_number: 13, description: "Even more most dramatic season yet!") }

  let!(:contestant_1) { Contestant.create!(name: "Dustin Kendrick", age: 30, hometown: "Chicago, IL", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_2) { Contestant.create!(name: "Mike Johnson", age: 31, hometown: "San Antonio, TX", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_3) { Contestant.create!(name: "Jed Wyatt", age: 25, hometown: "Knoxville, TN", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_4) { Contestant.create!(name: "Tyler Cameron", age: 26, hometown: "Jupiter, FL", bachelorette_id: bachelorette_2.id) }
  let!(:contestant_5) { Contestant.create!(name: "Peter Weber", age: 27, hometown: "Westlake Village, CA", bachelorette_id: bachelorette_2.id) }

  let!(:outing_1) { Outing.create!(name: "Sky Diving", location: "New York City", date: Date.tomorrow) }
  let!(:outing_2) { Outing.create!(name: "Roller Derby", location: "Denver", date: Date.tomorrow + 1) }
  let!(:outing_3) { Outing.create!(name: "Hot Air Balloon Ride", location: "New Mexico", date: Date.tomorrow + 2) }
  let!(:outing_4) { Outing.create!(name: "Helicopter Ride", location: "Los Angeles", date: Date.tomorrow + 3) }

  let!(:contestant_outing_1) { ContestantOuting.create!(contestant_id: contestant_1.id, outing_id: outing_1.id) }
  let!(:contestant_outing_2) { ContestantOuting.create!(contestant_id: contestant_1.id, outing_id: outing_2.id) }
  let!(:contestant_outing_3) { ContestantOuting.create!(contestant_id: contestant_1.id, outing_id: outing_3.id) }

  let!(:contestant_outing_4) { ContestantOuting.create!(contestant_id: contestant_2.id, outing_id: outing_1.id) }
  let!(:contestant_outing_5) { ContestantOuting.create!(contestant_id: contestant_2.id, outing_id: outing_2.id) }
  let!(:contestant_outing_6) { ContestantOuting.create!(contestant_id: contestant_2.id, outing_id: outing_4.id) }

  let!(:contestant_outing_7) { ContestantOuting.create!(contestant_id: contestant_3.id, outing_id: outing_1.id) }
  let!(:contestant_outing_8) { ContestantOuting.create!(contestant_id: contestant_3.id, outing_id: outing_3.id) }

  let!(:contestant_outing_9) { ContestantOuting.create!(contestant_id: contestant_4.id, outing_id: outing_1.id) }
  let!(:contestant_outing_10) { ContestantOuting.create!(contestant_id: contestant_4.id, outing_id: outing_4.id) }

  it "can show the outing's name, location, and date" do
    visit outing_path(outing_1)

    expect(page).to have_content(outing_1.name)
    expect(page).to have_content("Location: #{outing_1.location}")
    expect(page).to have_content("Date: #{outing_1.date.strftime("%m/%d/%Y")}")

    expect(page).to_not have_content(outing_2.name)
    expect(page).to_not have_content(outing_3.name)
    expect(page).to_not have_content("Location: #{outing_2.location}")
    expect(page).to_not have_content("Date: #{outing_3.date.strftime("%m/%d/%Y")}")
  end

  it "can show the count of contestants on the outing" do
    visit outing_path(outing_1)

    expect(page).to have_content("Count of Contestants: 4")
  end

  it "can show the contestant names on the outing" do
    visit outing_path(outing_1)

    expect(page).to have_content("Contestants:")
    expect(page).to have_content(contestant_1.name)
    expect(page).to have_content(contestant_2.name)
    expect(page).to have_content(contestant_3.name)
    expect(page).to have_content(contestant_4.name)
  end
end