class Like < ApplicationRecord
  belongs_to :english
  belongs_to :user
  validates_uniqueness_of :english_id, scope: :user_id
end
