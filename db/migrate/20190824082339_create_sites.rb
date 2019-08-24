class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string  :title
      t.string :link
      t.datetime  :last_error_time
      t.timestamps

      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
