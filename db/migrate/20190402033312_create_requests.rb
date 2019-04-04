class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :host_id
      t.integer :request_id

      t.timestamps
    end
    add_index :requests, :host_id
    add_index :requests, :request_id
    add_index :requests, [:host_id, :request_id], unique: true
  end
end
