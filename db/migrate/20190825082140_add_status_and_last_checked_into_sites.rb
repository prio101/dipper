class AddStatusAndLastCheckedIntoSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :status, :string
    add_column :sites, :last_checked, :datetime
  end
end
