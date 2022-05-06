class Machine < ApplicationRecord
  belongs_to :genre
  has_many   :machine_comments
end
