class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise   :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

  has_many :machine_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def user_name
    last_name + first_name
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
