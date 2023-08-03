require "rails_helper"

RSpec.describe "Bachlorette's Contestants Index Page", type: :feature do
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

  it "has a list of each contestant's info" do
    visit bachelorette_contestants_path(@bachelorette_1)
    
    expect(page).to have_content("#{@bachelorette_1.name}'s Contestants")
    
    within("ul#contestants") do
      expect(page).to have_link(@contestant_1.name)
      expect(page).to have_content("Age: #{@contestant_1.age}")
      expect(page).to have_content("Hometown: #{@contestant_1.hometown}")

      expect(page).to have_link(@contestant_2.name)
      expect(page).to have_content("Age: #{@contestant_2.age}")
      expect(page).to have_content("Hometown: #{@contestant_2.hometown}")

      expect(page).to have_link(@contestant_3.name)
      expect(page).to have_content("Age: #{@contestant_3.age}")
      expect(page).to have_content("Hometown: #{@contestant_3.hometown}")

      expect(page).to_not have_link(@contestant_4.name)
      expect(page).to_not have_link(@contestant_5.name)
    end
  end
end