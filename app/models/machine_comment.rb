class MachineComment < ApplicationRecord

  belongs_to :machine
  belongs_to :user

  validates :comment, length: { minimum: 1, maximum: 150 }
end
