class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, format: { with: /\A\d+\z/, message: "can only be a number" }
  validates :cuteness, presence: true
  validates :softness, presence: true
end
