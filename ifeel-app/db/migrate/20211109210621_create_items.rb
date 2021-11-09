class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.boolean :stock, default: false
      t.references :users, foreign_key: true
      t.string :shop
      t.timestamps
    end
  end
end
