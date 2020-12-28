require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get '/todos'

    response_json = JSON.parse(@response.body)

    assert_equal 2, response_json.count
  end
end
