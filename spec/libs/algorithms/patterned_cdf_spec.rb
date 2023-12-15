require 'rails_helper'

describe Algorithms::PatternedCdf do
  subject(:option) { Algorithms::PatternedCdf.new(ab_test).get_option }

  let(:ab_test) { Fabricate(:ab_test) }

  describe 'get_option' do
    it 'returns value from ab_test options' do
      ab_test.options.zip(ab_test.probabilities) do |option, _probability|
        expect(ab_test.options).to include option
        # TODO: check more here
      end
    end
  end
  # TODO: check
end