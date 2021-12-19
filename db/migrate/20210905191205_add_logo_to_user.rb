class AddLogoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :logo, :string
  end
end
