require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    group = Group.create(name: "test", meetup: "2024-1-1 1:1:1", location: "test")
    @user = User.create(username: "test", email: "test@test.com", password: "test", password_confirmation: "test", group_id: group.id)
    post "/sessions.json", params: { email: "test@test.com", password: "test" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/messages.json", headers: { Authorization: "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Message.where(user_id: User.first.id).count, data.length
  end

  test "show" do
    get "/messages/#{Message.first.id}.json", headers: { Authorization: "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "group_id", "content", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Message.count", 1 do
      post "/messages.json", headers: { Authorization: "Bearer #{@jwt}" }, params: { content: "test" }
      assert_response 200
    end
    post "/messages.json"
    assert_response 401
  end

  test "update" do
    patch "/messages/#{Message.first.id}.json", params: { content: "updated" }, headers: { Authorization: "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated", data["content"]
  end

  test "destroy" do
    assert_difference "Message.count", -1 do
      delete "/messages/#{Message.first.id}.json", headers: { Authorization: "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
