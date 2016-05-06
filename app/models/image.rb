class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    if picture.size > 10.megabytes
      errors.add(:picture, "Cannot exceed 10MB")
    end
  end
end
