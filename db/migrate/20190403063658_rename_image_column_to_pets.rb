class RenameImageColumnToPets < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :image, :pet_image
  end
end
