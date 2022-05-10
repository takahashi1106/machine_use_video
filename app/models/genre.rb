class Genre < ApplicationRecord
  
  has_many :machines, dependent: :destroy
end
