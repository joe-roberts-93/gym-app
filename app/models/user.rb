class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :goals, dependent: :destroy
  validates :email, uniqueness: true
  validates :first_name, :surname, :email, presence: true

  def self.top_lifters_last_week
    User.joins(workouts: :exercises)
        .where(workouts: { date: 3000.days.ago..Date.today })
        .select('users.id, users.first_name, users.surname, SUM(exercises.weight * exercises.reps * exercises.sets) AS total_weight')
        .group('users.id')
        .order('total_weight DESC')
  end
end
