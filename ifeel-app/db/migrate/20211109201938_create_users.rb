class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name, foreign_key: true
      t.string :phone
      t.integer :age
      t.string :email
      t.index :email, unique: true
      t.string :test
      t.timestamps
    end
  end
end
