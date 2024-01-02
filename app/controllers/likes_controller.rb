class LikesController < ApplicationController
  before_action :set_pet

  def create
    like = current_user.likes.build(pet_id: params[:pet_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(pet_id: params[:pet_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
