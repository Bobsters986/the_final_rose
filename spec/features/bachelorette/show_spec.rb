require "rails_helper"

RSpec.describe "Bachlorette Show Page", type: :feature do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")
    @bachelorette_2 = Bachelorette.create!(name: "Rachel Lindsay", season_number: 13, description: "Even more most dramatic season yet!")
    @bachelorette_3 = Bachelorette.create!(name: "Becca Kufrin", season_number: 14, description: "The most dramatic season yet! Again!")

    @contestant_1 = Contestant.create!(name: "Dustin Kendrick", age: 30, hometown: "Chicago, IL", bachelorette_id: @bachelorette_1.id)
    @contestant_2 = Contestant.create!(name: "Mike Johnson", age: 31, hometown: "San Antonio, TX", bachelorette_id: @bachelorette_1.id)
    @contestant_3 = Contestant.create!(name: "Jed Wyatt", age: 25, hometown: "Knoxville, TN", bachelorette_id: @bachelorette_1.id)
    @contestant_4 = Contestant.create!(name: "Tyler Cameron", age: 26, hometown: "Jupiter, FL", bachelorette_id: @bachelorette_2.id)
    @contestant_5 = Contestant.create!(name: "Peter Weber", age: 27, hometown: "Westlake Village, CA", bachelorette_id: @bachelorette_2.id)
  end

  it "can show the bachelorette's name, season number, and contestants" do
    visit "/bachelorettes/#{@bachelorette_1.id}"

    expect(page).to have_content(@bachelorette_1.name)
    expect(page).to have_content("Season #{@bachelorette_1.season_number} - #{@bachelorette_1.description}")
  end

  it "has a link to the bachelorette's contestants" do
    visit bachelorette_path(@bachelorette_1)
    expect(page).to have_link("Contestants")

    click_link("Contestants")
    expect(current_path).to eq(bachelorette_contestants_path(@bachelorette_1))
    expect(page).to have_content("#{@bachelorette_1.name}'s Contestants")

    within("#contestant") do
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content(@contestant_3.name)

      expect(page).to_not have_content(@contestant_4.name)
      expect(page).to_not have_content(@contestant_5.name)
    end
  end
end