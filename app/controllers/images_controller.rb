class ImagesController < ApplicationController
  def show
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new(image_params)

    if @image.save(image_params)
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])
    if @image.update(image_params)
      redirect_to gallery_image_path
    else
      render :edit
    end
  end

  def destroy
    gallery = Gallery.find(params[:gallery_id])
    image = gallery.images.find(params[:id])
    image.destory(image_params)
  end


  private

  def image_params
    params.
      require(:image).
      permit(:name, :url)
  end

end
