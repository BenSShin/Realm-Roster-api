require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "test", email: "test@test.com", password: "test", password_confirmation: "test")
    post "/sessions.json", params: { email: "test@test.com", password: "test" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/users.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end

  test "show" do
    get "/users/#{User.first.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "username", "email", "profile_picture", "group_id", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { username: "test", email: "test1@test.com", password: "test", password_confirmation: "test" }
      assert_response 200
    end
  end

  test "update" do
    patch "/users/#{@user.id}.json", params: { username: "updated" }, headers: { Authorization: "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated", data["username"]
  end

  test "destroy" do
    assert_difference "User.count", -1 do
      delete "/users/#{@user.id}.json", headers: { Authorization: "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
