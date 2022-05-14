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

  def self.guest
    find_or_create_by!(last_name: 'guest', first_name: 'user', email: 'guest@example.com', tel_number: '000-0000-0000') do |user|
    user.password = SecureRandom.urlsafe_base64
    end
  end

end
