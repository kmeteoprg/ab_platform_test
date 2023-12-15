module Algorithms
  class PatternedCdf
    attr_reader :ab_test

    def initialize(ab_test)
      @ab_test = ab_test
    end

    def get_option
      ReadCache.redis.lpop(ab_test.title) || next_iteration
    end

    private

    def next_iteration
      pattern = get_pattern(ab_test.probabilities, ab_test.options)
      value = pattern.pop
      ReadCache.redis.lpush(ab_test.title, pattern)
      value
    end

    def get_pattern(probabilities, options)
      gcd = probabilities.map(&:round).reduce(&:gcd)
      probabilities.zip(options).each_with_object([]) do |(i, option), pattern|
        pattern.concat [option] * (i/gcd)
      end
    end
  end
end
