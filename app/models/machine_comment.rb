class MachineComment < ApplicationRecord
  
  belongs_to :machine
  belongs_to :user
  
  validates :comment, presence: true
  
end
