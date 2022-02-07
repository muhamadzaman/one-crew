class CreateEstimateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :estimate_categories do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end

    add_index :estimate_categories, :name
  end
end
