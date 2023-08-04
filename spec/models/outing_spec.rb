require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe "relationships" do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

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
  let!(:contestant_outing_8) { ContestantOuting.create!(contestant_id: contestant_3.id, outing_id: outing_2.id) }
  let!(:contestant_outing_9) { ContestantOuting.create!(contestant_id: contestant_3.id, outing_id: outing_3.id) }

  let!(:contestant_outing_10) { ContestantOuting.create!(contestant_id: contestant_4.id, outing_id: outing_1.id) }
  let!(:contestant_outing_11) { ContestantOuting.create!(contestant_id: contestant_4.id, outing_id: outing_4.id) }

  describe "instance methods" do
    it "#contestant_count" do
      expect(outing_1.contestant_count).to eq(4)
      expect(outing_2.contestant_count).to eq(3)
      expect(outing_3.contestant_count).to eq(2)
      expect(outing_4.contestant_count).to eq(2)

      ContestantOuting.create!(contestant_id: contestant_5.id, outing_id: outing_4.id)
      expect(outing_4.contestant_count).to eq(3)
    end

    it "#contestant_names" do #unnecessary method
      expect(outing_1.contestant_names).to eq([contestant_1.name, contestant_2.name, contestant_3.name, contestant_4.name])
      expect(outing_2.contestant_names).to eq([contestant_1.name, contestant_2.name, contestant_3.name])
      expect(outing_3.contestant_names).to eq([contestant_1.name, contestant_3.name])
      expect(outing_4.contestant_names).to eq([contestant_2.name, contestant_4.name])
    end
  end
end
