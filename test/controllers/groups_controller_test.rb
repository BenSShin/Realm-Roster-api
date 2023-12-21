require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "index" do
    get "/groups.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end
end
