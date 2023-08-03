class ContestantOuting < ApplicationRecord
  belongs_to :contestants
  belongs_to :outings
end
