class TestsValuesController < ApplicationController
  def index
    render json: StatisticSerializer.new(statistic).as_json
  end

  def create
    head 422 and return if request.headers["Device-Token"].blank?

    render json: TestsValuesSerializer.new(values_for_device).as_json
  end

  private

  def values_for_device
    Rails.cache.fetch(request.headers["Device-Token"]) do
      current_device.tests_values.presence || Splitter.new(current_device).split
    end
  end

  def statistic
    TestsValue.get_statistic
  end
end
