class Check < ApplicationRecord
    validates :name, presence: true
    has_many :video_check_relations, dependent: :destroy
    has_many :videos, through: :video_check_relations, dependent: :destroy
end

