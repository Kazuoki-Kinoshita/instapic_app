class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create 
    @picture = current_user.pictures.build(picture_params)
    ContactMailer.contact_mail(@picture).deliver
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "新規投稿しました!"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  
  def edit
    unless @picture.user_id == current_user.id
      redirect_to pictures_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render :edit
    end    
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end
  
  private
  
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end