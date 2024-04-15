class English < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :english_tag_relations, dependent: :destroy
    has_many :tags, through: :english_tag_relations, dependent: :destroy
end 
