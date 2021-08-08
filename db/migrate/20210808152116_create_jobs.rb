class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.integer :creator_id
      t.string :category
      t.datetime :expiring_date
      t.timestamps
    end
  end
end
