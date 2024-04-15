class VideoCheckRelation < ApplicationRecord
  belongs_to :video
  belongs_to :check
end
