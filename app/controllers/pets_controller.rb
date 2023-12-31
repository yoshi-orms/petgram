class PetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pets = Pet.all.order(id: "DESC")
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
      redirect_to pet_path(@pet), notice: '投稿に成功しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
    if @pet.user != current_user
      redirect_to pets_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: '更新に成功しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to pets_path, notice: "投稿を削除しました。"
  end

  private
  def pet_params
    params.require(:pet).permit(:title, :body, :image)
  end
end
