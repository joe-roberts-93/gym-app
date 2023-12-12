class Movement < ApplicationRecord
  has_many :exercises, dependent: :destroy
end
