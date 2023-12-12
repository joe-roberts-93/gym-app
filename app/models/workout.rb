class Workout < ApplicationRecord
  has_many :exercises, as: :exerciseable, dependent: :destroy
  belongs_to :user
  belongs_to :gym
end
