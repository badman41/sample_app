class Micropost < ApplicationRecord
  belongs_to :user
  scope :all_order, ->{order(created_at: :desc)}
  scope :by_user_id, ->(user_id){where "user_id = ?", user_id}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true,
   length: {maximum: Settings.validate.micropost.content.maxlength}
  validate  :picture_size

  private

  def picture_size
    return if picture.size < Settings.picture_size.megabytes
    errors.add :picture, t("microposts.error_picture")
  end
end
