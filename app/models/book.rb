class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :author, :isbn, :description, presence: true
  validates :isbn, uniqueness: true

  # Allow both external URLs (http/https) and local asset paths
  validates :image_url, format: { with: /\A(https?:\/\/|\/?assets\/)?[\w\-.]+\.(png|jpg|jpeg|webp)\z/, message: "must be a valid URL or asset path" }, allow_blank: true

  def available?
    !borrowings.exists?(returned_at: nil)
  end
end
