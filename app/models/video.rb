class Video < ApplicationRecord
    belongs_to :user
    has_many :like2s, dependent: :destroy
    has_many :like2d_users, through: :like2s, source: :user
    has_many :replies, dependent: :destroy
    has_many :video_check_relations, dependent: :destroy
    has_many :checks, through: :video_check_relations, dependent: :destroy
end
