class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #shop_nameが存在しているかのバリデーション
  validates :shop_name, presence: true
  #imageが存在しているかのバリデーション
  validates :image, presence: true

  def get_image
    unless image.attached?  #imageが存在しない時
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path),filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
