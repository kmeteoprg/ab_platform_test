class TestsValuesSerializer < ActiveModel::Serializer
  attributes :title, :option

  def as_json(options = {})
    object.each_with_object({}) do |test_value, hash|
      hash[test_value.title] = test_value.option
    end
  end
end
