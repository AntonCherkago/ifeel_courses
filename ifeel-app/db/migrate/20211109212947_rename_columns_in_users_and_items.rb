class RenameColumnsInUsersAndItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :phone, :phone_number
    rename_column :items, :shop, :store
  end
end
