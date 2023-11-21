class User < ApplicationRecord
  has_many :goals
  has_many :workouts
end
