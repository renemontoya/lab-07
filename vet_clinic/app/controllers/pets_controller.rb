class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_url(@pet), notice: "Mascota creada con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_url(@pet), notice: "Mascota actualizada con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_url, notice: "Mascota eliminada."
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    # AQUÍ ESTÁ LO IMPORTANTE PARA EL LAB 7: Incluir :photo
    params.require(:pet).permit(:name, :species, :breed, :weight, :date_of_birth, :owner_id, :photo)
  end
end