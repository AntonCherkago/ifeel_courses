class DeleteColumnTestInUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :test
  end

  def down
    add_column :users, :test, :string
  end
end
