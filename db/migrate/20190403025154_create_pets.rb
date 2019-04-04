class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name,                 null: false
      t.integer :age
      t.boolean :mixed_vaccine
      t.string :dog_type
      t.string :image
      t.references :user,             foreign_key: true

      t.timestamps
    end
  end
end
