require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "test", email: "test@test.com", password: "test", password_confirmation: "test")
    post "/sessions.json", params: { email: "test@test.com", password: "test" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/groups.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Group.count, data.length
  end

  test "show" do
    get "/groups/#{Group.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "users", "messages", "meetup", "locatin", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Group.count", 1 do
      post "/groups.json", params: { name: "test", meetup: "2024-1-1 1:1:1", location: "test" }, headers: { Authorization: "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "update" do
    patch "/groups/#{Group.first.id}.json", params: { name: "updated" }, headers: { Authorization: "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated", data["name"]
  end

  test "destroy" do
    assert_difference "Group.count", -1 do
      delete "/groups/#{Group.first.id}.json", headers: { Authorization: "Bearer #{@jwt}" }
      assert_response 200
    end
    delete "/groups/#{Group.first.id}.json"
    assert_response 401
  end
end
