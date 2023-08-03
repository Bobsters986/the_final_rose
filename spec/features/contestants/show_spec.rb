require "rails_helper"

RSpec.describe "Contestant Show Page", type: :feature do
  let!(:bachelorette_1) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!") }
  let!(:bachelorette_2) { Bachelorette.create!(name: "Rachel Lindsay", season_number: 13, description: "Even more most dramatic season yet!") }

  let!(:contestant_1) { Contestant.create!(name: "Dustin Kendrick", age: 30, hometown: "Chicago, IL", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_2) { Contestant.create!(name: "Mike Johnson", age: 31, hometown: "San Antonio, TX", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_3) { Contestant.create!(name: "Jed Wyatt", age: 25, hometown: "Knoxville, TN", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_4) { Contestant.create!(name: "Tyler Cameron", age: 26, hometown: "Jupiter, FL", bachelorette_id: bachelorette_2.id) }
  let!(:contestant_5) { Contestant.create!(name: "Peter Weber", age: 27, hometown: "Westlake Village, CA", bachelorette_id: bachelorette_2.id) }

  let!(:outing_1) { Outing.create!(name: "Sky Diving", location: "New York City", date: "2019-05-13 18:00:00") }
  let!(:outing_2) { Outing.create!(name: "Roller Derby", location: "Denver", date: "2019-05-20 18:00:00") }
  let!(:outing_3) { Outing.create!(name: "Hot Air Balloon Ride", location: "New Mexico", date: "2019-05-27 18:00:00") }
  let!(:outing_4) { Outing.create!(name: "Helicopter Ride", location: "Los Angeles", date: "2019-06-03 18:00:00") }

  let!(:contestant_outing_1) { ContestantOuting.create!(contestant_id: contestant_1.id, outing_id: outing_1.id) }
  let!(:contestant_outing_2) { ContestantOuting.create!(contestant_id: contestant_1.id, outing_id: outing_2.id) }
  let!(:contestant_outing_3) { ContestantOuting.create!(contestant_id: contestant_1.id, outing_id: outing_3.id) }

  let!(:contestant_outing_4) { ContestantOuting.create!(contestant_id: contestant_2.id, outing_id: outing_1.id) }
  let!(:contestant_outing_5) { ContestantOuting.create!(contestant_id: contestant_2.id, outing_id: outing_4.id) }

  it "can show the contestant's name, season number, season description, and outings" do
    visit contestant_path(contestant_1)

    expect(page).to have_content(contestant_1.name)
    expect(page).to have_content("Season #{bachelorette_1.season_number} - #{bachelorette_1.description}")
    expect(page).to have_content("Outings:")

    within("ul#outings") do
      expect(page).to have_link(outing_1.name)
      expect(page).to have_link(outing_2.name)
      expect(page).to have_link(outing_3.name)
      expect(page).to_not have_link(outing_4.name)
    end
  end
end