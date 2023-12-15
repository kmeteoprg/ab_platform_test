require 'rails_helper'

describe TestsValuesSerializer do
  subject(:json) { JSON.parse TestsValuesSerializer.new(TestsValue.where(device_id: device.id)).to_json }

  let(:device) { Fabricate(:device) }
  let(:test1) { Fabricate(:ab_test) }
  let(:test2) { Fabricate(:ab_test) }

  let!(:test_value1) do
    Fabricate(:tests_value, device_id: device.id, ab_test_id: test1.id, title: test1.title, option: test1.options.take(1))
  end
  let!(:test_value2) do
    Fabricate(:tests_value, device_id: device.id, ab_test_id: test2.id, title: test2.title, option: test2.options.take(1))
  end

  describe 'to json' do
    it 'returns correct json' do
      expect(json[test1.title]).to eq test_value1.option
      expect(json[test2.title]).to eq test_value2.option
    end
  end
end