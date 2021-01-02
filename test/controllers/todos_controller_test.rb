require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get '/todos'

    assert_response :success
    response_json = JSON.parse(@response.body)

    assert_equal 2, response_json.count
  end

  test '#create' do
    assert_difference -> { Todo.count }, +1 do
      post '/todos', params: { description: 'Add tests to your rails app' }
    end

    assert_response :success
    response_json = JSON.parse(@response.body)

    assert_equal 'Add tests to your rails app', response_json['description']
  end

  test '#create with validation errors' do
    assert_no_difference -> { Todo.count } do
      post '/todos', params: { description: '' }
    end

    assert_response :unprocessable_entity
    response_json = JSON.parse(@response.body)

    assert_equal "Description can't be blank", response_json['error_messages'][0]
  end
end
