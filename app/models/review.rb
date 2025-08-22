class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
