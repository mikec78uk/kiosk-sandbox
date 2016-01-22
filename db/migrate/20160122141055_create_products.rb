class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
        t.string :range_name
        t.string :product_name
        t.integer :price_now
        t.text :description
      t.timestamps null: false
    end
  end
end
