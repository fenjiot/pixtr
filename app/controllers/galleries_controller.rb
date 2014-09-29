class GalleriesController < ApplicationController
  def index
    # We don't actually need render index becuase it till automatically render the method
    # name index, so if it was called game it would render :game.
    @galleries = Gallery.all.order("name ASC")
    render :index
  end 

  def new
    # continuing comment above: don't need to render :new, since Rails
    # knows to do render :method_name, in this case :new.
    @gallery = Gallery.new
    # creating a new gallery unassociated with any row
  end

  def create
    Gallery.create(
      name: params[:gallery][:name],
      description: params[:gallery][:description]
    )
    redirect_to "/"
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id]) 
    gallery.update(
      name: params[:gallery][:name],
      description: params[:gallery][:description]
    )
    redirect_to "/"
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/"
  end

end
