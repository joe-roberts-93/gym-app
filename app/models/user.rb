class User < ApplicationRecord
  has_many :workouts, dependent: :destroy
  has_many :goals, dependent: :destroy
end
