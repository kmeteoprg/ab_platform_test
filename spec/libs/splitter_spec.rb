require 'rails_helper'

describe Splitter do
  subject(:get_options) { Splitter.new(device).split }

  let!(:test1) { Fabricate(:ab_test) }
  let!(:test2) { Fabricate(:ab_test) }
  let(:device) { Fabricate(:device) }

  describe 'get_option' do
    it 'saves and returns options for device' do
      expect(get_options.map(&:id)).to eq(device.reload.tests_values.map(&:id))
    end
  end
  # TODO: check
end