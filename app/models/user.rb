class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :englishes,dependent: :destroy
  has_many :videos,dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :like2s, dependent: :destroy
  has_many :liked_englishes, through: :likes, source: :english
  has_many :like2d_videos, through: :like2s, source: :video
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  def already_liked?(english)
    self.likes.exists?(english_id: english.id)
  end
  def already_like2d?(video)
    self.like2s.exists?(video_id: video.id)
  end
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記       
end
