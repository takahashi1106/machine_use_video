class Machine < ApplicationRecord
  has_one_attached :video
  belongs_to :genre
  has_many   :machine_comments
end
