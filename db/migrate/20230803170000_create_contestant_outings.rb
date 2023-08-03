class CreateContestantOutings < ActiveRecord::Migration[7.0]
  def change
    create_table :contestant_outings do |t|
      t.references :contestants, null: false, foreign_key: true
      t.references :outings, null: false, foreign_key: true

      t.timestamps
    end
  end
end
