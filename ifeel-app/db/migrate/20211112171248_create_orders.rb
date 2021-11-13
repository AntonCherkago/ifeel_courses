class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.integer :product_price
      t.integer :product_count
      t.timestamps
    end
  end
end
