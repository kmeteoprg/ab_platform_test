class CreateAbTestsValues < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :token, null: false, index: { unique: true }
      t.timestamps
    end

    create_table :ab_tests do |t|
      t.string :title
      t.string :options, array: true, default: []
      t.float :probabilities, array: true, default: []
      t.string :description
      t.timestamps
    end

    create_join_table :ab_tests, :devices, table_name: 'tests_values' do |t|
      t.string :option
      t.string :title
      t.index [:device_id, :ab_test_id]
      t.index [:ab_test_id, :device_id]
      t.timestamps
    end
  end
end
