class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all.order("name ASC")
  end 

  def new
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.create(gallery_params)
    redirect_to(gallery_path(gallery))
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id]) 
    gallery.update(gallery_params)

    redirect_to "/"
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy

    redirect_to "/"
  end


  private

  def gallery_params
    # whitelists attributes
    params.require(:gallery).permit(:name, :description)
  end

end
