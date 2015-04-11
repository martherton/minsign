class ImagesController < ApplicationController
  def index
  	 @images = Image.all
    @image = Image.new
  end

  def create
  	 @image = Image.new(image_params)

    if @image.save
      render json: { message: "success", fileID: @image.id }, :status => 200
      
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
      respond_to do |format|
  format.html { redirect_to :back }
  format.json { head :no_content }
end
  end  


   private
  def image_params
    params.require(:image).permit(:avatar, :draft_id, :tag_list => [])
  end
end
