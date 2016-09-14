class PlayerSet < ApplicationRecord
  has_many :players, dependent: :destroy
end
