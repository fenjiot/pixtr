class ImagesController < ApplicationController
  def show
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.recent
    @likes = @image.likes
    @available_groups = Group.all
    @available_tags = Tag.all
  end

  def new
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.new
  end

  def create
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.new(image_params)

    if @image.save(image_params)
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def edit
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.find(params[:id])
    if @image.update(image_params)
      redirect_to gallery_image_path
    else
      render :edit
    end
  end

  def destroy
    gallery = load_personal_gallery_from_url
    image = gallery.images.find(params[:id])
    image.destory(image_params)
  end


  private

  def image_params
    params.
      require(:image).
      permit(:name, :url, group_ids: [], tag_ids: [])
  end

  def load_gallery_from_url
    Gallery.find(params[:gallery_id])
  end

  def load_personal_gallery_from_url
    current_user.galleries.find(params[:gallery_id])
  end
end
