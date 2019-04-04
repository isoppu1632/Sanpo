class RemoveAddresFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :addres, :text
  end
end
