class Machine < ApplicationRecord

  has_one_attached :video
  belongs_to :genre
  has_many   :machine_comments, dependent: :destroy
  has_many   :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
