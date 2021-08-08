class CreateJobApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :job_applications do |t|
      t.integer :job_id
      t.string :name
      t.datetime :birth_date
      t.string :email
      t.string :phone
      t.string :address
      t.string :professional_qualifications
      t.string :resume

      t.timestamps
    end
  end
end
