class RemoveDescriptionFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :description, :text
  end
end
