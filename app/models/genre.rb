class Genre < ApplicationRecord

  has_many :machines, dependent: :destroy

  validates :name, presence: true
  
end
