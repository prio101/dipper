class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :name
      t.string  :description
      t.string  :link
      t.text  :contact_person_details
      t.timestamps

      t.references :user, foreign_key: true
    end
  end
end
