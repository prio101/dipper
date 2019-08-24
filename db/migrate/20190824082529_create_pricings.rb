class CreatePricings < ActiveRecord::Migration[5.2]
  def change
    create_table :pricings do |t|
      t.string  :title
      t.string  :description
      t.float :price

      t.timestamps
    end
  end
end
