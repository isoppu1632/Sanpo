class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create(pet_params)
    redirect_to user_path(current_user)
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if pet.update(pet_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :mixed_vaccine, :dog_type, :pet_image).merge(user_id: current_user.id)
  end

  def set_image

  end
end
