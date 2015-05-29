class Baner < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :slogan, presence: true, length: { maximum: 140 }

  def picture_size
    if picture.size > 10.megabytes
      errors.add(:picture, "should be less than 10MB")
    end
  end
end
