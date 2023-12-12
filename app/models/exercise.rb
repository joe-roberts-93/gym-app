class Exercise < ApplicationRecord
  belongs_to :exerciseable, polymorphic: true
  belongs_to :movement
  belongs_to :workout, optional: true
  belongs_to :goal, optional: true

  # Set up a validation to ensure that either a workout or a goal is present
  # before saving an exercise
end
