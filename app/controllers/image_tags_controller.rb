class ImageTagsController < ApplicationController
  def create
    @tag = Tag.find(params[:tag_id])
    image = ImageTags.new(image_id: image.id, tag_id: @tag.id)
      redirect_to image_path
  end
end
