class AbTest < ApplicationRecord
  has_many :tests_values
  has_many :devices, through: :tests_values

  scope :actual_for, ->(device) { where('created_at < ?', device.created_at) }

  validate :probablities_sum_is_100

  def apply_value(value, device)
    tests_values.create!(device_id: device.id, option: value, title: title)
  end

  private

  def probablities_sum_is_100
    errors.add(:probabilities, "Probabilities sum must be 100") if probabilities.sum.round != 100
  end
end
