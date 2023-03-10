class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to favorites_path, notice: "#{favorite.picture.user.user_name}さんのブログをお気に入りに登録しました！"
  end

  def index
    @favorites = current_user.favorites
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "#{favorite.picture.user.user_name}さんのブログのお気に入りを解除しました！"
  end
end
