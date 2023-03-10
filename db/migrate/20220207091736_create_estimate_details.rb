class CreateEstimateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :estimate_details do |t|
      t.string :job, null: false
      t.decimal :units, null: false
      t.decimal :time
      t.decimal :rate, null: false
      t.decimal :cost, null: false
      t.decimal :margin_multiple, null: false
      t.decimal :bid, null: false
      t.references :estimate, null: false, foreign_key: true
      t.string :estimate_category, null: false
      t.string :unit_of_measure, null: false

      t.timestamps
    end
  end
end
