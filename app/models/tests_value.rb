class TestsValue < ApplicationRecord
  belongs_to :device
  belongs_to :ab_test

  # def self.get_statistic
  #   find_by_sql('
  #     WITH cte AS
  #       (SELECT title, option,
  #       COUNT(*) over(partition BY title) devices_in_test
  #       FROM ab_tests_devices AS p1),
  #     ctd AS
  #       (SELECT title title2, option option2, COUNT(*) AS devices_with_value
  #       FROM ab_tests_devices GROUP BY title, option)
  #     SELECT DISTINCT title, option, devices_with_value, devices_in_test
  #     FROM cte e JOIN ctd d on title=title2 and option=option2
  #     ORDER BY title, option;
  # ')
  # end

  def self.get_statistic
    find_by_sql('
      SELECT DISTINCT title, option,
      COUNT(*) over(partition BY title) devices_in_test,
      COUNT(*) over(partition BY title, option) devices_with_option
      FROM tests_values
  ')
  end
end