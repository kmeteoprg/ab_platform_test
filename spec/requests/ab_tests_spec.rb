require 'swagger_helper'

RSpec.describe 'ab_tests', type: :request do

  path '/ab_tests' do

    post('for_device ab_test') do
      parameter name: 'Device-Token', :in => :header, required: true, :type => :string

      response(200, 'successful') do
        let('Device-Token') { "1" }
        run_test!
      end
    end

    get('list ab_tests') do
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
