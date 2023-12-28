class LikesController < ApplicationController
  def create
    like = current_user.likes.build(pet_id: params[:pet_id])
    like.save
    redirect_to pets_path
  end

  def destroy
    like = Like.find_by(pet_id: params[:pet_id], user_id: current_user.id)
    like.destroy
    redirect_to pets_path
  end
end
