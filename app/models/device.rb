class Device < ApplicationRecord
  has_many :tests_values
  has_many :ab_tests, through: :tests_values
end
