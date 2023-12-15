class StatisticSerializer < ActiveModel::Serializer
  # def as_json
  #   object.group_by(&:title).map do |title, options|
  #     { "title": title,
  #       "total_count": options.first.devices_in_test,
  #       "count_by_options": options.map { |item| { item.option => item.devices_with_value } }
  #     }
  #   end
  # end
  def as_json(option={})
    object.group_by(&:title).map do |title, options|
      { "title": title,
        "total_count": options.first.devices_in_test,
        "count_by_options": options.each_with_object({}) do |item, object|
          object[item.option] = item.devices_with_option
        end
      }
    end
  end
end
