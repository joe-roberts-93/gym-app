class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  has_many :exercises
end
