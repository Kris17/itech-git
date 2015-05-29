class NewsPost < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :description, presence: true
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader

  private
  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
