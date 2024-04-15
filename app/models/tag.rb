class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :english_tag_relations, dependent: :destroy
    has_many :englishes, through: :english_tag_relations, dependent: :destroy
end
