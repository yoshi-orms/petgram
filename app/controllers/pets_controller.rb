class PetsController < ApplicationController

  def index
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pet_path(@pet)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
  end

  private
  def pet_params
    params.require(:pet).permit(:title, :body, :image)
  end
end
