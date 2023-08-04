require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  let!(:bachelorette_1) { Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!") }
  let!(:bachelorette_2) { Bachelorette.create!(name: "Rachel Lindsay", season_number: 13, description: "Even more most dramatic season yet!") }

  let!(:contestant_1) { Contestant.create!(name: "Dustin Kendrick", age: 30, hometown: "Chicago, IL", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_2) { Contestant.create!(name: "Mike Johnson", age: 31, hometown: "San Antonio, TX", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_3) { Contestant.create!(name: "Jed Wyatt", age: 25, hometown: "Knoxville, TN", bachelorette_id: bachelorette_1.id) }
  let!(:contestant_4) { Contestant.create!(name: "Tyler Cameron", age: 26, hometown: "Jupiter, FL", bachelorette_id: bachelorette_2.id) }
  let!(:contestant_5) { Contestant.create!(name: "Peter Weber", age: 27, hometown: "Westlake Village, CA", bachelorette_id: bachelorette_2.id) }

  describe "instance methods" do
    it "#average_contestant_age" do
      expect(bachelorette_1.average_contestant_age).to eq(28.7)
      expect(bachelorette_2.average_contestant_age).to eq(26.5)

      Contestant.create!(name: "John Doe", age: 30, hometown: "Chicago, IL", bachelorette_id: bachelorette_1.id)
      Contestant.create!(name: "Jane Doe", age: 30, hometown: "Chicago, IL", bachelorette_id: bachelorette_2.id)

      expect(bachelorette_1.average_contestant_age).to eq(29.0)
      expect(bachelorette_2.average_contestant_age).to eq(27.7)
    end
  end
end
