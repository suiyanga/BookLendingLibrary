class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :borrowings, dependent: :destroy

  has_many :reviews, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: true }
end
