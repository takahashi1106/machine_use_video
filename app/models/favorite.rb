class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :machine
end
