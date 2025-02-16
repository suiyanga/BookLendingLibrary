class Book < ApplicationRecord
  has_many :borrowings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :author, :isbn, :description, presence: true
  validates :isbn, uniqueness: true

  # Allow both external URLs (http/https) and local asset paths
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp([ "http", "https" ]), message: "must be a valid URL" }
  def available?
    !borrowings.exists?(returned_at: nil)
  end
end
