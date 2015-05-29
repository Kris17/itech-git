class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :post_comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validates :user_id, presence: true

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
