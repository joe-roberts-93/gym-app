class Goal < ApplicationRecord
  has_one :exercise, as: :exerciseable, dependent: :destroy
  belongs_to :user
end
