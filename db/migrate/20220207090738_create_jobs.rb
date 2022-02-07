class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.string :address
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :jobs, :name
  end
end
