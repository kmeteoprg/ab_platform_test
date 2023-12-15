module Algorithms
  class BaseAlgorithm
    attr_reader :ab_test

    def initialize(ab_test)
      ab_test = ab_test
    end

    def get_option(ab_test_attributes)
      raise NotImplementedError, "This method must be implemented in the child class."
    end
  end
end
