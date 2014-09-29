class GalleriesController < ApplicationController
  def index
    # We don't actually need render index becuase it till automatically render the method
    # name index, so if it was called game it would render :game.
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
end
