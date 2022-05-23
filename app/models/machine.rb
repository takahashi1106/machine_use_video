class Machine < ApplicationRecord

  has_one_attached :video
  belongs_to :genre
  has_many   :machine_comments, dependent: :destroy
  has_many   :favorites,        dependent: :destroy

  validates :name,        presence: true
  validates :explanation, presence: true
  validates :genre_id,    presence: true
  validates :video,       presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
