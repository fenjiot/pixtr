class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  def has_image?
    !images.empty?
  end

  def first_image
    images.first.url
  end
end
