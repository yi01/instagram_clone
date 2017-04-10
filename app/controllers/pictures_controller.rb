class PicturesController < ApplicationController
  def create
      @picture = Picture.new(picture_params)
      if @picture.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
      @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user)
  end

  private
  def picture_params
      params.require(:picture).permit(:content, :image).merge(user_id: current_user.id)
  end
end
