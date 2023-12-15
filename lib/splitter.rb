class Splitter
  attr_reader :device, :algorithm

  def initialize(device, algorithm = Algorithms::PatternedCdf)
    @device = device
    @algorithm = algorithm
  end

  def split
    AbTest.actual_for(device).map do |ab_test|
      value = algorithm.new(ab_test).get_option
      ab_test.apply_value(value, device)
    end
    device.tests_values
  end
end