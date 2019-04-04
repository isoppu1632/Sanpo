class Pet < ApplicationRecord
  belongs_to :user

  mount_uploader :pet_image, ImageUploader
end
