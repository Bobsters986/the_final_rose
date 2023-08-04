class Bachelorette < ApplicationRecord
  has_many :contestants

   def average_contestant_age
    contestants.average(:age).round(1).to_f
   end
end
