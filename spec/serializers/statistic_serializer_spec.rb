require 'rails_helper'

describe StatisticSerializer do
  # TODO: add Fabricator add Faker
  subject(:json) { JSON.parse StatisticSerializer.new(TestsValue.get_statistic).to_json }

  describe 'to json' do
    before do
      10.times { Fabricate(:device) }
      t1 = Fabricate(:ab_test)
      t2 = Fabricate(:ab_test)
      Device.all.each do |device|
        Fabricate(:tests_value, device_id: device.id, ab_test_id: t1.id, title: t1.title, option: t1.options.take(1))
        Fabricate(:tests_value, device_id: device.id, ab_test_id: t2.id, title: t2.title, option: t2.options.take(1))
      end
    end
    it 'returns correct json' do
      json.each do |test_statistic|
        expect(test_statistic['total_count']).to eq TestsValue.where(title: test_statistic['title']).count
        expect(test_statistic['count_by_options']).to eq TestsValue.where(title: test_statistic['title']).map(&:option).tally
      end
    end
  end
end